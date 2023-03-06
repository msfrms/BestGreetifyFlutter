import 'package:best_greetify/gen/colors.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

@immutable
class HolidayListItemProps {
  final String day;
  final String month;
  final String url;
  final String text;
  final Function onTap;

  HolidayListItemProps(
      {required this.day,
      required this.month,
      required this.url,
      required this.text,
      required this.onTap});
}

@immutable
class HolidayListItemWidget extends StatelessWidget {
  final HolidayListItemProps props;

  HolidayListItemWidget({required this.props});

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
        fontSize: 16,
        color: ColorName.black,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none,
        height: 1.3);

    final TextStyle dayStyle = TextStyle(
        fontSize: 25,
        color: ColorName.black,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none);

    final TextStyle monthStyle = TextStyle(
        fontSize: 10,
        color: ColorName.black,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.none);

    final shadow = BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 5,
          offset: Offset(0, 1), // changes position of shadow
        ),
      ],
    );
    final date = Container(
      decoration: shadow,
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 0),
        child: Column(
          children: [
            Text(props.day, style: dayStyle),
            Text(props.month.toUpperCase(), style: monthStyle)
          ],
        ),
      ),
    );
    final content = Container(
      decoration: shadow,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 46,
              height: 46,
              child: CachedNetworkImage(
                imageUrl: props.url,
                fit: BoxFit.cover,
              ),
            ),
            Flexible(
                child: Padding(
              padding: EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
              child: Text(props.text, style: textStyle),
            ))
          ],
        ),
      ),
    );
    return GestureDetector(
      onTap: () => props.onTap(),
      child: IntrinsicHeight(        
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: date,
            ),
            Flexible(child: content)
          ],
        ),
      ),
    );
  }
}
