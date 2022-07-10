import 'dart:io';

import 'package:bc_image_editor/edit_with_gesture.dart';
import 'package:bc_image_editor_app/components/my_app_bar.dart';
import 'package:bc_image_editor_app/screens/home_screen.dart';
import 'package:bc_image_editor_app/utils/constants.dart';
import 'package:bc_image_editor_app/utils/etc.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:screenshot/screenshot.dart';
import 'package:path/path.dart';

class ImageEditing extends StatefulWidget {
  final String frontPath, bgPath;
  const ImageEditing({Key? key, this.frontPath = "", this.bgPath = ""})
      : super(key: key);

  @override
  State<ImageEditing> createState() => _ImageEditingState();
}

class _ImageEditingState extends State<ImageEditing> {
  int _currentIndex = 0;
  EditMode editMode = EditMode.viewMode;
  final ScreenshotController _screenshotController = ScreenshotController();
  var scr = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: kLightGrey,
        appBar: MyAppBar(
          title: const Text("Editing"),
          rightIcon: const Icon(Icons.save),
          rightIconTap: () async {
            int _imageNumber = 0;

            final _directory = await getSavedImageDirectory();
            var _fileCheck = File(
                '${_directory.path}bcImage' + _imageNumber.toString() + '.png');
            while (await _fileCheck.exists()) {
              _imageNumber++;
              _fileCheck = File(
                  '${_directory.path}bcImage' + _imageNumber.toString() + '.png');
            }
            await _screenshotController.captureAndSave(_directory.path,
                fileName: basename(_fileCheck.path));

            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        body: Screenshot(
          controller: _screenshotController,
          child: EditWithGesture(
            frontImage: widget.frontPath,
            bgImage: widget.bgPath,
            editMode: editMode,
          ),
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(() {
              _currentIndex = i;
              switch (_currentIndex) {
                case 0:
                  editMode = EditMode.viewMode;
                  break;
                case 1:
                  editMode = EditMode.size;
                  break;
                case 2:
                  editMode = EditMode.horizontalRotate;
                  break;
                case 3:
                  editMode = EditMode.verticalRotate;
                  break;
                case 4:
                  editMode = EditMode.rotate2D;
                  break;
              }
            });
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.aspect_ratio),
              title: const Text("View"),
              selectedColor: Colors.purple,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.zoom_out_map),
              title: const Text("Size"),
              selectedColor: Colors.pink,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.arrow_forward),
              title: const Text("H. Rot."),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.arrow_upward),
              title: const Text("V. Rot."),
              selectedColor: Colors.teal,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.crop_rotate_sharp),
              title: const Text("Rot. 2D"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      );
  }
}
