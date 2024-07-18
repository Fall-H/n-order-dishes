import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetailItemState {
  static final OrderDetailItemState _instance = OrderDetailItemState._internal();

  OrderDetailItemState._internal();

  factory OrderDetailItemState() {
    return _instance;
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}