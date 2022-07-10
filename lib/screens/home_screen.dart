import 'dart:io';

import 'package:bc_image_editor_app/components/grid_list.dart';
import 'package:bc_image_editor_app/components/my_app_bar.dart';
import 'package:bc_image_editor_app/components/my_icon_button.dart';
import 'package:bc_image_editor_app/components/grid_box.dart';
import 'package:bc_image_editor_app/components/text_information.dart';
import 'package:bc_image_editor_app/components_etc/select_image.dart';
import 'package:bc_image_editor_app/screens/image_view.dart';
import 'package:bc_image_editor_app/utils/constants.dart';
import 'package:bc_image_editor_app/utils/etc.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Widget>? listWidget = [];

class _HomeScreenState extends State<HomeScreen> {
  List<FileSystemEntity> fileList = [];
  List<Widget> fileListWidget = [];
  void lastSavedImages() async {
    fileListWidget = [];
    final directory = await getSavedImageDirectory();
    fileList = Directory(directory.path).listSync()
      ..sort((b, a) => a.statSync().modified.compareTo(b.statSync().modified));
    for (FileSystemEntity element in fileList) {
      fileListWidget.add(
        GridBox(
          onImageClick: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ImageView(
                  bgImagePath: element.path,
                ),
              ),
            );
          },
          leadingImagePath: element.path,
          onDeleteClick: () async {
            showMyDialog(
              context,
              "Delete Image",
              "Are you sure?",
              () async {
                await element.delete();
                lastSavedImages();
                Navigator.pop(context, false);
              },
            );
          },
          onShareClick: () async => Share.shareFiles([element.path]),
        ),
      );
    }
    setState(() {
      listWidget = fileListWidget;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lastSavedImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text("Saved Images"),
        isHome: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: fileList.isEmpty
                ? const Center(
                    child: TextInformation(
                      infoText:
                          "Your list is empty \nYou can add new image from press + button",
                    ),
                  )
                : GridList(
                    children: listWidget,
                  ),
          ),
          MyIconButton(
            icon: kAddIcon,
            onTap: () {
              Alert(
                context: context,
                content: const SelectImage(
                  title: "Select İmage",
                ),
                buttons: [],
              ).show();
            },
          )
        ],
      ),
    );
  }
}
