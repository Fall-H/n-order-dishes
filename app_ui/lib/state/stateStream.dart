import 'dart:async';

import 'package:flutter/material.dart';

class StateStream {
  GlobalKey<ScaffoldState> key = GlobalKey();

  static final StateStream _instance = StateStream._internal();

  StateStream._internal();

  factory StateStream() {
    return _instance;
  }

  int shoppingCartCount = 0;
  final StreamController<int> shoppingCartStream = StreamController<int>();

  StreamController<int> getShoppingCartStream() {
    return shoppingCartStream;
  }
}