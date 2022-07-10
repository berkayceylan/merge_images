import 'package:flutter/material.dart';

class GridList extends StatelessWidget {
  final List<Widget>? children;
  const GridList({Key? key, this.children}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(10),
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 2,
      children: children!,
    );
  }
}
