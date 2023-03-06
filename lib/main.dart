import 'package:best_greetify/service/category_service.dart';
import 'package:best_greetify/service/post_service.dart';
import 'package:best_greetify/widgets/holiday_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'gen/colors.gen.dart';
import 'widgets/grid_list_page.dart';

void main() {
  runApp(
    CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: ColorName.white,
        textTheme: CupertinoTextThemeData(primaryColor: ColorName.white,)
      ),
      color: ColorName.white,
      home: GreetifyApp(
        props: GreetifyProps(
            compilations: GreetifyCategoryProps(page: 1),
            birthdays: GreetifyCategoryProps(page: 2),
            holidays: GreetifyCategoryProps(page: 3))
        ),
    )
  );
}

@immutable
class GreetifyCategoryProps {
  final int page;
  GreetifyCategoryProps({required this.page});
}

@immutable
class GreetifyProps {
  final GreetifyCategoryProps compilations;
  final GreetifyCategoryProps birthdays;
  final GreetifyCategoryProps holidays;

  GreetifyProps(
      {required this.compilations,
      required this.birthdays,
      required this.holidays});
}

@immutable
class GreetifyApp extends StatelessWidget {
  final GreetifyProps props;

  GreetifyApp({required this.props});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Greetify',
      theme: ThemeData(),
      home: CupertinoTabScaffold(
          backgroundColor: ColorName.white,
          tabBar: CupertinoTabBar(
            border: Border(),
            backgroundColor: ColorName.blue,
            activeColor: ColorName.white,
            inactiveColor: Colors.white70,
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Icon(Icons.wallpaper),
                ),
                label: "Подборки",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Icon(Icons.calendar_today_outlined),
                ),
                label: "Дни рождения",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Icon(Icons.account_balance_wallet),
                ),
                label: "Праздники",
              ),
            ],
          ),          
          tabBuilder: (contex, index) {
            switch (index) {
              case 0:
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text("Открытки", style: TextStyle(color: ColorName.white)),
                    backgroundColor: ColorName.blue,
                  ),
                  child: GridListPageStatefulWidget(
                    categoryService: LifestyleCategoryService(),
                    postByCategoryId: (id, page) =>
                        LifestylePostService(categoryId: id, page: page)
                            .fetchPosts(),
                    newsPostByPage: (page) =>
                        LifestyleNewsPostService(page: page).fetchPosts(),
                    popularPostByPage: (page) =>
                        LifestylePopularPostService(page: page).fetchPosts(),
                  )
                );
              case 1:
                return CupertinoPageScaffold(
                  navigationBar: CupertinoNavigationBar(
                    middle: Text("Открытки", style: TextStyle(color: ColorName.white)),
                    backgroundColor: ColorName.blue,
                  ),
                  child: GridListPageStatefulWidget(
                    categoryService: BirthdayCategoryService(),
                    postByCategoryId: (id, page) =>
                        BirthdayPostService(categoryId: id, page: page)
                            .fetchPosts(),
                    newsPostByPage: (page) =>
                        BirthdayNewsPostService(page: page).fetchPosts(),
                    popularPostByPage: (page) =>
                        BirthdayPopularPostService(page: page).fetchPosts(),
                  )
                );
              case 2:
                return CupertinoPageScaffold(                  
                  navigationBar: CupertinoNavigationBar(                    
                    middle: Text("Открытки", style: TextStyle(color: ColorName.white)),
                    backgroundColor: ColorName.blue,
                  ),
                  child: HolidayListStatefulWidget()
                );
              default:
                return Text("");
            }
          }
          ),
    );
  }
}
