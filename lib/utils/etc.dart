import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<void> showMyDialog(BuildContext context, String title, String text, VoidCallback approve) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title:  Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(text),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Yes'),
            onPressed: approve,
          ),
          TextButton(
            child: const Text('No'),
            onPressed: (){
              Navigator.pop(context, false);
            },
          ),
        ],
      );
    },
  );
}

Future<Directory> getSavedImageDirectory() async {
  final Directory appDirec = await getApplicationDocumentsDirectory();
  final directory = Directory(appDirec.path + "/savedImages/");
  if (!(await directory.exists())) {
    await directory.create();
  }
  return directory;
}

Future<File> myGetImage(ImageSource type) async {
  ImagePicker imagePicker = ImagePicker();
  var pickedImage = await imagePicker.pickImage(source: type);
  File imageFile;
  if (pickedImage != null) {
    print(pickedImage.path);

    imageFile = File(pickedImage.path);
    return imageFile;
  }
  return File(""); //!
}

