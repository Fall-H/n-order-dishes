import 'dart:async';

import 'package:flutter/material.dart';

class StateStream {
  GlobalKey<ScaffoldState> key = GlobalKey();

  static final StateStream _instance = StateStream._internal();

  StateStream._internal();

  factory StateStream() {
    return _instance;
  }

  StreamController<int> _shoppingCartStream = StreamController<int>();

  void setShoppingCartStream(StreamController<int> stream) {
    _shoppingCartStream = stream;
  }

  StreamController<int> getShoppingCartStream() {
    return _shoppingCartStream;
  }
}
