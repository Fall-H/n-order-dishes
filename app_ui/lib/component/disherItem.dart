import 'package:flutter/material.dart';

import '../state/dishesTypeItemState.dart';

class DishesItem extends StatefulWidget {
  String title;
  String image;
  int index;

  DishesItem(
      {super.key,
      required this.title,
      required this.index,
      required this.image});

  @override
  State<DishesItem> createState() =>
      _DishesItemState(this.title, this.index, this.image);
}

class _DishesItemState extends State<DishesItem> {
  String title;
  String image;
  int index;

  _DishesItemState(this.title, this.index, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Color(0x334CAF50),
          borderRadius: BorderRadius.circular(2.0),
        ),
        padding: const EdgeInsets.only(
          top: 5.0,
          right: 10.0,
          bottom: 5.0,
          left: 10.0,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Image.network(width: 100.0, height: 100.0, fit: BoxFit.cover, image,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
            return Icon(Icons.error);
          }),
          Text(title,
              style: const TextStyle(color: Color(0xFF424242), fontSize: 24)),
        ]));
    // child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //   Image.network(width: 100.0, height: 100.0, fit: BoxFit.cover, image,
    //       errorBuilder: (BuildContext context, Object exception,
    //           StackTrace? stackTrace) {
    //     return Icon(Icons.error);
    //   }),
    //   Align(
    //     alignment: Alignment.topCenter,
    //     child: Container(
    //       padding: const EdgeInsets.only(
    //         left: 10.0,
    //       ),
    //       // height: 100.0,
    //       child: Text(title,
    //           style:
    //               const TextStyle(color: Color(0xFF424242), fontSize: 24)),
    //     ),
    //   ),
    //   Align(
    //       alignment: Alignment.bottomCenter,
    //       child: InkWell(
    //         onTap: () {},
    //         child: Container(
    //           decoration: BoxDecoration(
    //             color: Color(0xFFFFEB3B),
    //             borderRadius: BorderRadius.circular(4.0),
    //           ),
    //           padding: EdgeInsets.all(2.0),
    //           child: Icon(Icons.add, color: Color(0xFF424242)),
    //         ),
    //       ))
    // ]));
  }
}
