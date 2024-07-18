import 'package:app_ui/component/orderDetailItem.dart';
import 'package:app_ui/component/orderItem.dart';
import 'package:flutter/material.dart';

import '../model/order.dart';
import '../state/orderDetailItemState.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPage();
}

class _OrderPage extends State<OrderPage> {
  List<Order> list = [
    Order(id: 0, createTime: DateTime.now(), schedule: 1, scheduleText: '完成', orderDetailLists: [
      OrderDetail(
          id: 0,
          title: "番茄炒鸡蛋6",
          image:
              "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          count: 1),
      OrderDetail(
          id: 0,
          title: "番茄炒鸡蛋6",
          image:
              "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          count: 1),
      OrderDetail(
          id: 0,
          title: "番茄炒鸡蛋6",
          image:
              "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          count: 1),
    ]),
    Order(id: 0, createTime: DateTime.now(), schedule: 0.3, scheduleText: '已处理', orderDetailLists: [
      OrderDetail(
          id: 0,
          title: "番茄炒鸡蛋6",
          image:
              "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          count: 1),
      OrderDetail(
          id: 0,
          title: "番茄炒鸡蛋6",
          image:
              "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          count: 1),
      OrderDetail(
          id: 0,
          title: "番茄炒鸡蛋6",
          image:
              "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          count: 1),
      OrderDetail(
          id: 0,
          title: "番茄炒鸡蛋6",
          image:
              "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
          count: 1)
    ])
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: OrderDetailItemState().scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFFE8F5E9),
        title: Text('订单'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            );
          },
        ),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return OrderItem(
                order: list[index],
                func: (Order order, List<OrderDetail> orderDetailList) {
                  _createBottomSheet(context, order, orderDetailList);
                });
          }),
    );
  }

  _createBottomSheet(BuildContext context, Order order, List<OrderDetail> orderDetailList) {
    showModalBottomSheet(
      barrierColor: Color(0x80ffffff),
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
            height: 800,
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                  child: LinearProgressIndicator(
                    value: order.schedule,
                    valueColor: AlwaysStoppedAnimation(Color(0xFFE8F5E9)),
                    backgroundColor: Colors.white,
                    minHeight: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0x334CAF50),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                Text(order.scheduleText, style: TextStyle(color: Color(0xff795548), fontSize: 12)),
                Column(
                  children: orderDetailList.map((_element) {
                    return OrderDetailItem(order: _element);
                  }).toList(),
                )
              ],
            ));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
