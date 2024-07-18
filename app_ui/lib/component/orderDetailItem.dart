import 'package:app_ui/state/dishesItemState.dart';
import 'package:flutter/material.dart';

import '../model/dishes.dart';
import '../model/order.dart';
import '../state/dishesTypeItemState.dart';
import '../state/stateStream.dart';

class OrderDetailItem extends StatefulWidget {
  OrderDetail order;

  OrderDetailItem({super.key, required this.order});

  @override
  State<OrderDetailItem> createState() => _OrderDetailItemState(order: order);
}

class _OrderDetailItemState extends State<OrderDetailItem> {
  OrderDetail order;

  _OrderDetailItemState({required this.order});

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
                      Text(order.title,
                          style: const TextStyle(
                              color: Color(0xff795548), fontSize: 24)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('数量: ${order.count.toString()}', style: TextStyle(color: Color(0xff795548))),
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
        order.image, errorBuilder:
            (BuildContext context, Object exception, StackTrace? stackTrace) {
      return Icon(Icons.error);
    });
  }
}
