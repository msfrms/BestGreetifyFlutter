import 'package:best_greetify/api/models.dart';
import 'package:best_greetify/routes/app_routes.dart';
import 'package:best_greetify/service/holiday_post_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
part 'grid_list.freezed.dart';

class GridListItemProps {
  final String imageUrl;
  final Function onTap;

  GridListItemProps({required this.imageUrl, required this.onTap});
}

@freezed
class GridListProps with _$GridListProps {
  const factory GridListProps.listOf(List<GridListItemProps> value) = GridItems;
  const factory GridListProps.inProgress() = InProgress;
  const factory GridListProps.failed(String message) = Failed;
}

@immutable
class GridListWidget extends StatelessWidget {
  final GridListProps props;

  GridListWidget({Key? key, required this.props}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return props.when(
        listOf: (items) => StaggeredGridView.countBuilder(
              padding: EdgeInsets.zero,
              crossAxisCount: 4,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () => items[index].onTap(),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.rectangle,
                  ),
                  child: CachedNetworkImage(
                    imageUrl: items[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  StaggeredTile.count(2, index.isEven ? 3 : 2),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
        inProgress: () => Shimmer.fromColors(
            child: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) => Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.rectangle,
                  ),
                  child: Container(),
                ),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(2, index.isEven ? 3 : 2),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
            ),
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100),
        failed: (text) => Padding(
              padding: EdgeInsets.only(top: 30),
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(text),
              ),
            ));
  }
}

class GridListStatefulWidget extends StatefulWidget {
  final int elementId;

  GridListStatefulWidget({required this.elementId});

  @override
  State<StatefulWidget> createState() {
    return _GridListState(elementId: elementId);
  }
}

class _GridListState extends State<GridListStatefulWidget> {
  final int elementId;
  List<PostHoliday> posts = List.empty();
  bool isLoading = false;

  _GridListState({required this.elementId});

  void fetchPosts() async {
    setState(() {
      isLoading = true;
    });
    final result = await PostHolidayService(postId: elementId).fetchPosts();
    setState(() {
      isLoading = false;
      posts = result;
    });
  }

  @override
  void initState() {
    fetchPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return GridListWidget(
        props: GridListProps.inProgress(),
      );
    } else {
      return GridListWidget(
        props: GridListProps.listOf(posts
            .map((e) => GridListItemProps(
                imageUrl: "https://api.wizl.me${e.url}",
                onTap: () => AppRoutes(context: context, title: "Открытка")
                    .openImageUrl("https://api.wizl.me${e.url}")))
            .toList()),
      );
    }
  }
}
