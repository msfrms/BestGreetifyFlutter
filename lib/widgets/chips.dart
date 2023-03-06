import 'package:flutter/material.dart';

import 'chip.dart';

@immutable
class ChipsProps {
  final List<ChipProps> chips;

  ChipsProps({required this.chips});
}

@immutable
class ChipsWidget extends StatelessWidget {

  final ChipsProps props;

  ChipsWidget({required this.props});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ChipWidget(props: props.chips[index]),
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount: props.chips.length
    );
  }
}