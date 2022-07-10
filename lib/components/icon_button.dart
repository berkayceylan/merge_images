import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final IconData icon;
  const IconButton({Key? key, this.icon=Icons.eight_mp, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onTap,
          child: Icon(icon, size: 60,),
        ),
      ),
    );
  }
}
