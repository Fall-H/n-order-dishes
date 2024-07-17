class Order {
  int id;
  DateTime createTime;
  List<OrderDetail> orderDetailLists;

  Order({required this.id, required this.createTime, required this.orderDetailLists});

  @override
  String toString() {
    return id.toString();
  }
}

class OrderDetail {
  int id;
  String title;
  int count;

  OrderDetail({required this.id, required this.title, required this.count});
}