import 'package:bc_image_editor_app/utils/constants.dart';
import 'package:flutter/material.dart';

class TextInformation extends StatelessWidget {
  final String infoText;
  const TextInformation({Key? key, this.infoText = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        padding: const EdgeInsets.all(45),
        decoration: BoxDecoration(
          color: kBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          infoText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
