import 'package:bc_image_editor_app/utils/constants.dart';
import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final IconData? icon;
  final VoidCallback? onTap;
  final Color color;
  const MyIconButton({Key? key, this.icon, this.onTap, this.color = kOrange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          child: Icon(icon, size: 60, color: color,),
        ),
      ),
    );
  }
}
