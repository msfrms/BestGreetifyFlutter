import 'package:best_greetify/api/models.dart';
import 'package:best_greetify/core/action/post_action.dart';
import 'package:best_greetify/core/state/posts.dart';
import 'package:best_greetify/gen/colors.gen.dart';
import 'package:best_greetify/routes/app_routes.dart';
import 'package:best_greetify/service/category_service.dart';
import 'package:best_greetify/widgets/chip.dart';
import 'package:best_greetify/widgets/chips.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'grid_list.dart';

@immutable
class PageProps {
  final GridListProps content;
  final Function onTap;

  PageProps({required this.content, required this.onTap});
}

@immutable
class GridListPageProps {
  final ChipsProps chips;
  final List<PageProps> pages;

  GridListPageProps({required this.chips, required this.pages});
}

@immutable
class GridListPageWidget extends StatelessWidget {
  final GridListPageProps props;
  final PageController controller;

  GridListPageWidget({required this.props, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorName.gray,      
      child: Column(
        children: [
          SizedBox(
            height: 64,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
              child: ChipsWidget(props: props.chips),
            ),
          ),
          Expanded(            
            child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                onPageChanged: (index) => props.pages[index].onTap(),
                itemBuilder: (context, index) => GridListWidget(
                  key: PageStorageKey(index),
                  props: props.pages[index].content)
                )
            )          
        ],
      ),
    );
  }
}

typedef PostByCategoryId = Future<List<Post>> Function(
    int categoryId, int page);
typedef PostByPage = Future<List<Post>> Function(int page);

class GridListPageStatefulWidget extends StatefulWidget {
  final CategoryService categoryService;
  final PostByCategoryId postByCategoryId;
  final PostByPage newsPostByPage;
  final PostByPage popularPostByPage;

  GridListPageStatefulWidget({
      required this.categoryService,
      required this.postByCategoryId,
      required this.newsPostByPage,
      required this.popularPostByPage
  });      

  @override
  State<StatefulWidget> createState() {
    return _GridListPageState(
        categoryService: categoryService,
        postByCategoryId: postByCategoryId,
        popularPostByPage: popularPostByPage,
        newsPostByPage: newsPostByPage);
  }
}

class _GridListPageState extends State<GridListPageStatefulWidget> {
  PostsState state = PostsState.initial();

  final CategoryService categoryService;
  final PostByCategoryId postByCategoryId;
  final PostByPage newsPostByPage;
  final PostByPage popularPostByPage;
  final controller = PageController(initialPage: 0, keepPage: true);  

  _GridListPageState(
      {required this.categoryService,
      required this.postByCategoryId,
      required this.newsPostByPage,
      required this.popularPostByPage});

  void scrollToSelectedPage() {
    final selectedPage = state.selectedIndex();
    if (selectedPage != -1) {
      controller.animateToPage(selectedPage,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  void fetchCategories() async {
    final categories = await categoryService.fetchCategories();
    state = state.reduce(action: ReceiveCategories(categories: categories));
    final category = state.categories.elementAt(0);
    List<Post> posts = List.empty();
    if (category.isPopular()) {
      posts = await popularPostByPage(1);
    } else if (category.isNews()) {
      posts = await newsPostByPage(1);
    }
    else {
      posts = await postByCategoryId(category.id, 1);
    }
    setState(() {      
      state = state.reduce(
          action: PostSuccessBy(category: category, posts: posts));
    });
  }

  void fetchPostsBy({required Category category}) async {
    if (state.byCategoryId[category.id]!.posts.isNotEmpty) {
      return;
    }
    setState(() {
      state = state.reduce(action: PostInProgressBy(categoryId: category.id));
    });
    List<Post> posts = List.empty();
    if (category.isPopular()) {
      posts = await popularPostByPage(1);
    } else if (category.isNews()) {
      posts = await newsPostByPage(1);
    }
    else {
      posts = await postByCategoryId(category.id, 1);
    }
    setState(() {
      state = state.reduce(
          action: PostSuccessBy(category: category, posts: posts));
    });
  }

  @override
  initState() {
    fetchCategories();
    super.initState();
  }

  PageProps from(PostState postState, BuildContext context, Category category) {
    switch (postState.status) {
      case Status.inProgress:
        return PageProps(
            content: GridListProps.inProgress(),
            onTap: () {
              fetchPostsBy(category: category);
            });
      case Status.failed:
        return PageProps(
            content: GridListProps.failed("Упс, мы опять упали"),
            onTap: () {
              fetchPostsBy(category: category);
            });
      case Status.success:
        return PageProps(
            content: GridListProps.listOf(postState.posts
                .map((e) => GridListItemProps(
                  imageUrl: "https://api.wizl.me${e.image.url}",
                  onTap: () => AppRoutes(context: context, title: "Открытка")
                    .openImageUrl("https://api.wizl.me${e.image.url}")
                ))
                .toList()),
            onTap: () {
              setState(() {
                state = state.reduce(action: SelectedCategoryBy(category: category));
              });
            });
    }
  }

  @override
  Widget build(BuildContext context) {    
    if (state.byCategoryId.isNotEmpty) {
      return GridListPageWidget(
        props: GridListPageProps(
          chips: ChipsProps(
              chips: state.categories
                  .map((category) => ChipProps(
                      title: category.name,
                      isSelected: category.id == state.selectedCategory.id,
                      onTap: () {
                        setState(() {
                          state = state.reduce(
                              action:
                                  SelectedCategoryBy(category: category));
                          scrollToSelectedPage();
                        });
                        fetchPostsBy(category: category);
                      }))
                  .toList()),
          pages: state.categories
              .map((e) => from(state.byCategoryId[e.id]!, context, e))
              .toList(),
        ),
        controller: controller,
      );
    } else {
      return GridListWidget(
        props: GridListProps.inProgress(),
      );
    }
  }
}
