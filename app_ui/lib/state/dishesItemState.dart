import 'package:app_ui/component/dishesItem.dart';
import 'package:flutter/cupertino.dart';

import '../model/dishes.dart';

class DishesItemState extends ChangeNotifier {
  static final DishesItemState _instance = DishesItemState._internal();

  DishesItemState._internal();

  factory DishesItemState() {
    return _instance;
  }

  Map<Dishes, int> _map = {};

  void add(Dishes dishes) {
    if (_map.containsKey(dishes)) {
      _map[dishes] = _map[dishes]! + 1;
    } else {
      _map[dishes] = 1;
    }
    notifyListeners();
  }

  void reduction(Dishes dishes) {
    if (_map[dishes] != 1) {
      _map[dishes] = _map[dishes]! - 1;
    } else {
      _map.remove(dishes);
    }
    notifyListeners();
  }

  int? get(Dishes dishes) {
    return _map[dishes] ?? 0;
  }

  List<Dishes> getList() {
    List<Dishes> list = [];
    _map.forEach((k, v) {
      list.add(k);
    });
    return list;
  }

  Map<Dishes, int> getAll() {
    return _map;
  }

  int getTotal() {
    int sum = 0;
    _map.forEach((k, v) {
      sum += v;
    });
    return sum;
  }
}
