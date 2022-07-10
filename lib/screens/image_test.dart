import 'dart:io';

import 'package:flutter/material.dart';

class ImageTest extends StatelessWidget {
  final String? fileName;
  const ImageTest({Key? key, this.fileName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.file(File(fileName!)),
    );
  }
}
