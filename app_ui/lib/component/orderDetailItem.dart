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
    return Container();
  }
}
