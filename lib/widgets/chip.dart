import 'package:best_greetify/gen/colors.gen.dart';
import 'package:flutter/material.dart';

@immutable
class ChipProps {
  final String title;
  final bool isSelected;
  final Function onTap;

  ChipProps({required this.title, required this.isSelected, required this.onTap});
}

@immutable
class ChipWidget extends StatelessWidget {

  final ChipProps props;

  ChipWidget({required this.props});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        height: 30,
        child: Container(
          decoration: BoxDecoration(
            color: props.isSelected ? Colors.orangeAccent : Colors.white,
            borderRadius: BorderRadius.circular(10),
          ), //       <--- BoxDecoration here
          child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 9, bottom: 6),
              child: Text(
                props.title, 
                style: TextStyle(
                  decoration: TextDecoration.none,                
                  fontSize: 12, 
                  color: ColorName.black,
                ),
              )
          ),
        ),
      ),
      onTap: () => props.onTap(),
    );
  }
}