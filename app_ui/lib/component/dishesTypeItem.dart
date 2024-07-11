import 'package:flutter/material.dart';

class DishesTypeItem extends StatefulWidget {
  String title;

  DishesTypeItem({super.key, required this.title});

  @override
  State<DishesTypeItem> createState() => _DishesTypeItemState(this.title);
}

class _DishesTypeItemState extends State<DishesTypeItem> {
  String title;
  bool isSelected = false;

  _DishesTypeItemState(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text(title)
    );
  }
}
