import 'package:flutter/material.dart';

class ShoppingCartState {
  GlobalKey<ScaffoldState> key = GlobalKey();

  static final ShoppingCartState _instance = ShoppingCartState._internal();

  ShoppingCartState._internal();

  factory ShoppingCartState() {
    return _instance;
  }

  int total = 0;

}