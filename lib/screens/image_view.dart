import 'package:bc_image_editor/bc_image_editor.dart';
import 'package:bc_image_editor_app/components/my_app_bar.dart';
import 'package:bc_image_editor_app/components/my_icon_button.dart';
import 'package:bc_image_editor_app/components_etc/select_image.dart';
import 'package:bc_image_editor_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:share_plus/share_plus.dart';

class ImageView extends StatefulWidget {
  final String? bgImagePath;
  const ImageView({Key? key, @required this.bgImagePath}) : super(key: key);

  @override
  State<ImageView> createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightGrey,
        appBar: const MyAppBar(
          title: Text("View Background"),
        ),
        body: Column(
          children: [
            Expanded(
              child: BcImageEditor(
                bgWidth: MediaQuery.of(context).size.width,
                frontImage: "",
                bgImage: widget.bgImagePath!,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyIconButton(
                  icon: kAddIcon,
                  onTap: () {
                    Alert(
                      context: context,
                      content: SelectImage(
                        title: "Select Front Image",
                        bgImage: widget.bgImagePath,
                      ),
                      buttons: [],
                    ).show();
                  },
                ),
                MyIconButton(
                  icon: Icons.share,
                  color: kGreenColor,
                  onTap: () {
                    Share.shareFiles([widget.bgImagePath!]);
                  },
                ),
              ],
            )
          ],
        ),
      );
  }
}
