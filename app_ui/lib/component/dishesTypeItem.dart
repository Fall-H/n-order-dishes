import 'package:flutter/material.dart';

import '../state/dishesTypeItemState.dart';

class DishesTypeItem extends StatefulWidget {
  String title;
  int index;

  void Function(int) backFunction;

  DishesTypeItem({super.key, required this.title, required this.index, required this.backFunction});

  @override
  State<DishesTypeItem> createState() =>
      _DishesTypeItemState(this.title, this.index, this.backFunction);
}

class _DishesTypeItemState extends State<DishesTypeItem> {
  DishesTypeItemState dishesTypeItemState = DishesTypeItemState();

  String title;
  int index;

  void Function(int) backFunction;

  _DishesTypeItemState(this.title, this.index, this.backFunction);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          backFunction(index);
        },
        child: Container(
            padding: const EdgeInsets.only(
              top: 5.0,
              right: 10.0,
              bottom: 5.0,
              left: 10.0,
            ),
            color: index == dishesTypeItemState.getIndex()
                ? Color(0xFFE8F5E9)
                : Color(0x0),
            child: Row(children: [
              Text(title,
                  style: TextStyle(
                      color: index == dishesTypeItemState.getIndex()
                          ? Color(0xFF000000)
                          : Color(0xFF424242),
                      fontSize: 20))
            ])));
  }
}
