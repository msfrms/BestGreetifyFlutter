import 'package:best_greetify/api/models.dart';
import 'package:best_greetify/gen/colors.gen.dart';
import 'package:best_greetify/routes/app_routes.dart';
import 'package:best_greetify/service/holiday_post_service.dart';
import 'package:best_greetify/widgets/holiday_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

@immutable
class HolidayListSection {
  final String title;
  final List<HolidayListItemProps> items;

  HolidayListSection({required this.title, required this.items});
}

@immutable
class HolidayListProps {
  final List<HolidayListSection> items;

  HolidayListProps({required this.items});
}

@immutable
class HolidayListWidget extends StatelessWidget {
  final HolidayListProps props;

  HolidayListWidget({required this.props});

  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
        fontSize: 18,
        color: ColorName.black,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none);

    final List<Widget> widgets = props.items.expand((section) {
      final List<Widget> title = [
        Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Text(section.title.toUpperCase(), style: style),
        )
      ];
      final items = section.items.map((e) => Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: HolidayListItemWidget(props: e),
          ));
      title.addAll(items);
      return title;
    }).toList();

    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widgets.length,
          itemBuilder: (context, index) => widgets[index]),
    );
  }
}

class HolidayListStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HolidayListState();
  }
}

class _HolidayListState extends State<HolidayListStatefulWidget> {
  List<List<Holiday>> holidays = List.empty();

  @override
  void initState() {
    fetchHolidays();
    super.initState();
  }

  void fetchHolidays() async {
    holidays = [];
    final result = await HolidayService().fetchPosts();
    await initializeDateFormatting('ru_RU', null);
    setState(() {
      holidays = result.fold<List<List<Holiday>>>(holidays, (acc, element) {
        if (acc.isEmpty) {
          acc.add([element]);
        } else if (acc.last.last.month == element.month) {
          acc.last.add(element);
        } else {
          acc.add([element]);
        }
        return acc;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (holidays.isEmpty) {
      return Text("");
    } else {
      return HolidayListWidget(
        props: HolidayListProps(
            items: holidays
                .map((holiday) => HolidayListSection(
                    title: DateFormat('MMMM', "RU_ru").format(DateTime(
                        holiday.last.year,
                        holiday.last.month,
                        holiday.last.day)),
                    items: holiday
                        .map((e) => HolidayListItemProps(
                            onTap: () => AppRoutes(title: e.title, context: context)
                              .openPostsById(e.postId),
                            day: "${e.day}".padLeft(2, '0'),
                            month: DateFormat('MMM', "RU_ru")
                                .format(DateTime(e.year, e.month, e.day)),
                            url: "https://api.wizl.me${e.url}",
                            text: e.title))
                        .toList()))
                .toList()),
      );
    }
  }
}
