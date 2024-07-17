import 'package:app_ui/state/dishesItemState.dart';
import 'package:flutter/material.dart';

import '../model/dishes.dart';
import '../model/order.dart';
import '../state/dishesTypeItemState.dart';
import '../state/stateStream.dart';

class OrderItem extends StatefulWidget {
  Order order;

  OrderItem({super.key, required this.order});

  @override
  State<OrderItem> createState() => _OrderItemState(order: order);
}

class _OrderItemState extends State<OrderItem> {
  Order order;

  _OrderItemState({required this.order});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
