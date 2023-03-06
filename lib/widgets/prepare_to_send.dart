import 'package:best_greetify/gen/colors.gen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class PrepareToSendProps {
  final Function onSend;
  final String imageUrl;

  PrepareToSendProps({required this.imageUrl, required this.onSend});
}

@immutable
class PrepareToSendWidget extends StatelessWidget {
  final PrepareToSendProps props;

  PrepareToSendWidget({required this.props});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: GestureDetector(
              onTap: () => props.onSend(),
              child: Text(
                "Отправить",
                style: TextStyle(
                    color: ColorName.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              ),
            ),
            onPressed: () {},
          ),
          middle: Text("Открытка", style: TextStyle(color: ColorName.white)),
          backgroundColor: ColorName.blue,
        ),
        child: Center(
          child: CachedNetworkImage(
            imageUrl: props.imageUrl,
          ),
        ));
  }
}
