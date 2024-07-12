class DishesTypeItemState {
  static final DishesTypeItemState _instance = DishesTypeItemState._internal();

  DishesTypeItemState._internal();

  factory DishesTypeItemState() {
    return _instance;
  }

  int index = 0;

  void setIndex(int _index) {
    index = _index;
  }

  int getIndex() {
    return index;
  }
}