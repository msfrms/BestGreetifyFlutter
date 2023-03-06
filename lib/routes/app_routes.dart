import 'package:best_greetify/core/utils/share_files.dart';
import 'package:best_greetify/gen/colors.gen.dart';
import 'package:best_greetify/widgets/grid_list.dart';
import 'package:best_greetify/widgets/prepare_to_send.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  final BuildContext context;
  final String title;

  AppRoutes({required this.title, required this.context});

  void openPostsById(int postId) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text(title, style: TextStyle(color: ColorName.white)),
                  backgroundColor: ColorName.blue,
                ),
                child: GridListStatefulWidget(elementId: postId)),
            title: title));
  }

  void openImageUrl(String imageUrl) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => PrepareToSendWidget(
                  props: PrepareToSendProps(
                      imageUrl: imageUrl,
                      onSend: () {
                        ShareFiles.shareImageUrl(imageUrl);
                      }),
                ),
            title: title));
  }
}
