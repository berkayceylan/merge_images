import 'dart:io';

import 'package:bc_image_editor_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title, rightIcon;
  final VoidCallback? rightIconTap;
  final bool isHome;
  const MyAppBar(
      {Key? key,
      this.title = const Text(""),
      this.rightIcon = const Icon(null),
      this.rightIconTap, this.isHome = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: kOrange,
      leading: InkWell(
        child: const Icon(Icons.arrow_back_ios),
        onTap: (){
          if(!isHome) {
            Navigator.maybePop(context);
          } else {
            exit(0);
          }
        },
      ),
      actions: [
        InkWell(
          child: rightIcon,
          onTap: rightIconTap,
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
