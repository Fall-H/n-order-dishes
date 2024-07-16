import 'package:flutter/material.dart';

import '../state/dishesTypeItemState.dart';
import '../state/stateStream.dart';

class DishesItem extends StatefulWidget {
  String title;
  String image;
  int id;

  DishesItem(
      {super.key, required this.title, required this.id, required this.image});

  @override
  State<DishesItem> createState() =>
      _DishesItemState(this.title, this.id, this.image);
}

class _DishesItemState extends State<DishesItem> {

  String title;
  String image;
  int id;

  _DishesItemState(this.title, this.id, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 125.0,
        decoration: BoxDecoration(
          color: Color(0x334CAF50),
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.only(
          top: 5.0,
          right: 10.0,
          bottom: 5.0,
          left: 10.0,
        ),
        margin: const EdgeInsets.only(
          top: 5.0,
          right: 5.0,
          bottom: 5.0,
          left: 5.0,
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Image.network(width: 100.0, height: 100.0, fit: BoxFit.cover, image,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
              return Icon(Icons.error);
            }),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  margin: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Text(title,
                      style: const TextStyle(
                          color: Color(0xFF424242), fontSize: 24))),
            )
          ]),
          Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  StateStream().shoppingCartCount++;
                  StateStream().getShoppingCartStream().sink.add(StateStream().shoppingCartCount);
                },
                child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                      color: Color(0xffffeb3b),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Icon(Icons.add, color: Color(0xff795548), size: 15)),
              )),
        ]));
  }
}
