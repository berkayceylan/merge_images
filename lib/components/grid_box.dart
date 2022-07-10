import 'dart:io';

import 'package:bc_image_editor_app/utils/constants.dart';
import 'package:flutter/material.dart';

class GridBox extends StatelessWidget {
  final String? title, leadingImagePath;
  final VoidCallback? onImageClick, onDeleteClick, onShareClick;
  const GridBox({Key? key, this.title, this.leadingImagePath, this.onImageClick, this.onDeleteClick, this.onShareClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: InkWell(
            onTap: onImageClick,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: kLightGrey,
              ),
              child: Image.file(
                File(leadingImagePath!),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: onDeleteClick,
              child: const Icon(Icons.delete),
              style: ElevatedButton.styleFrom(primary: kRedColor),
            ),
            const SizedBox(width: 20,),
            ElevatedButton(
              onPressed: onShareClick,
              child: const Icon(Icons.share),
              style: ElevatedButton.styleFrom(primary: kGreenColor),
            ),
          ],
        )
      ],
    );
  }
}
