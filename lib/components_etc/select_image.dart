import 'package:bc_image_editor_app/screens/image_editing.dart';
import 'package:bc_image_editor_app/screens/image_view.dart';
import 'package:flutter/material.dart';
import 'package:bc_image_editor_app/components/icon_text.dart';

import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SelectImage extends StatefulWidget {
  final String? title, bgImage;
  const SelectImage({
    Key? key,
    @required this.title,
    this.bgImage = "",
  }) : super(key: key);
  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? pickedImage;
  File? imageFile;

  Future<void> getImage(ImageSource type) async {
    pickedImage = await imagePicker.pickImage(source: type);

    if (pickedImage != null) {
      setState(() {
        imageFile = File(pickedImage!.path);
        if (widget.bgImage == "") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageView(
                bgImagePath: imageFile!.path,
              ),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ImageEditing(
                frontPath: imageFile!.path,
                bgPath: widget.bgImage!,
              ),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.title!),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => getImage(ImageSource.gallery),
                child: const IconText(
                  text: "From Gallery",
                  icon: Icons.collections,
                ),
              ),
              const SizedBox(width: 30),
              InkWell(
                onTap: () => getImage(ImageSource.camera),
                child: const IconText(
                  text: "From Camera",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
