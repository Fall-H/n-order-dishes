class Order {
  int id;
  DateTime createTime;
  String scheduleText;
  double schedule;
  List<OrderDetail> orderDetailLists;

  Order({required this.id, required this.createTime, required this.orderDetailLists, required this.schedule, required this.scheduleText});

  @override
  String toString() {
    return id.toString();
  }
}

class OrderDetail {
  int id;
  String title;
  String image;
  int count;

  OrderDetail({required this.id, required this.title, required this.image, required this.count});
}