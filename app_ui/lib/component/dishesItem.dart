import 'package:app_ui/state/dishesItemState.dart';
import 'package:flutter/material.dart';

import '../model/dishes.dart';
import '../state/dishesTypeItemState.dart';
import '../state/stateStream.dart';

class DishesItem extends StatefulWidget {
  Dishes dishes;

  DishesItem({super.key, required this.dishes});

  @override
  State<DishesItem> createState() => _DishesItemState(this.dishes);
}

class _DishesItemState extends State<DishesItem> {
  DishesItemState dishesItemState = DishesItemState();
  Dishes dishes;

  _DishesItemState(this.dishes);

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
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          _createImage(),
          Expanded(
              flex: 1,
              child: Container(
                  height: 100,
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(dishes.title,
                          style: const TextStyle(
                              color: Color(0xFF424242), fontSize: 24)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          _createOptionButton(Icons.remove_outlined,
                              dishesItemState.get(dishes) ?? 0, true),
                          Text(dishesItemState.get(dishes) == 0
                              ? ''
                              : dishesItemState.get(dishes).toString()),
                          _createOptionButton(Icons.add,
                              dishesItemState.get(dishes) ?? 0, false)
                        ],
                      )
                    ],
                  )))
        ]));
  }

  Image _createImage() {
    return Image.network(
        width: 100.0,
        height: 100.0,
        fit: BoxFit.cover,
        dishes.image, errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
      return Icon(Icons.error);
    });
  }

  Widget _createOptionButton(IconData icon, int count, bool isShow) {
    return count == 0 && isShow
        ? Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: 20.0,
            height: 20.0)
        : Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: () {
                    if (!isShow) {
                      setState(() {
                        dishesItemState.add(dishes);
                      });

                      StateStream()
                          .getShoppingCartStream()
                          .sink
                          .add(dishesItemState.getTotal());
                    } else {
                      if (dishesItemState.get(dishes) == 0) {
                        return;
                      }

                      setState(() {
                        dishesItemState.reduction(dishes);
                      });

                      StateStream()
                          .getShoppingCartStream()
                          .sink
                          .add(dishesItemState.getTotal());
                    }
                  },
                  child: Container(
                      width: 20.0,
                      height: 20.0,
                      decoration: BoxDecoration(
                        color: Color(0xffffeb3b),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(icon, color: Color(0xff795548), size: 15)),
                )));
  }
}
