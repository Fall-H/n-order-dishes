import 'package:app_ui/model/order.dart';
import 'package:flutter/material.dart';

import '../component/orderDetailItem.dart';

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPage();
}

class _OrderDetailPage extends State<OrderDetailPage> {
  List<OrderDetail> list = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return OrderDetailItem(order: list[index]);
          }),
    );
  }
}