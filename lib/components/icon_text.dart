import 'package:flutter/material.dart';
import 'package:bc_image_editor_app/utils/constants.dart';

class IconText extends StatelessWidget {
  final String text;
  final IconData icon;

   const IconText({Key? key, this.text = "", this.icon = Icons.camera_alt_outlined}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kLightBlue,
            ),
            padding: const EdgeInsets.all(25),
            child: Icon(
              icon,
              color: kOrange,
              size: 40,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff5d6373),
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}