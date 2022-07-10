
import 'package:flutter/material.dart';
import 'package:bc_image_editor_app/utils/constants.dart';

class MyGridView extends StatelessWidget {
  final VoidCallback? onTap;
  MyGridView({this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap!,
      child: Container(
        height: MediaQuery.of(context).size.height - 100,
        width: MediaQuery.of(context).size.width,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 4,
          children: List.generate(
            150,
                (index) => Container(
              padding: const EdgeInsets.all(8),
              child: Image.asset("assets/images/door.png"),
              decoration: BoxDecoration(
                color: kWhite,
                border: Border.all(color: kGreyBorder, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}