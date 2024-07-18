import 'package:app_ui/state/dishesItemState.dart';
import 'package:flutter/material.dart';

import '../model/dishes.dart';
import '../model/order.dart';
import '../state/dishesTypeItemState.dart';
import '../state/stateStream.dart';

class OrderItem extends StatefulWidget {
  Order order;
  Function(Order order, List<OrderDetail> orderDetailList) func;

  OrderItem({super.key, required this.order, required this.func});

  @override
  State<OrderItem> createState() => _OrderItemState(order: order, func: func);
}

class _OrderItemState extends State<OrderItem> {
  Order order;
  Function(Order order, List<OrderDetail> orderDetailList) func;

  _OrderItemState({required this.order, required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
          top: 5.0,
          right: 10.0,
          bottom: 5.0,
          left: 10.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFE8F5E9),
          borderRadius: BorderRadius.circular(6),
        ),
        child: InkWell(
            onTap: () {
              func(order, order.orderDetailLists);
            },
            child: Column(
              children: [
                Row(
                  children: order.orderDetailLists.length <= 3
                      ? order.orderDetailLists.map((_element) {
                          return _createOrderDetail(_element);
                        }).toList()
                      : [
                          _createOrderDetail(order.orderDetailLists[0]),
                          _createOrderDetail(order.orderDetailLists[1]),
                          _createOrderDetail(order.orderDetailLists[2]),
                          Expanded(
                              flex: 1,
                              child: Container(
                                // padding: const EdgeInsets.only(
                                //     left: 30.0, bottom: 5, top: 5),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xff795548),
                                ),
                              ))
                        ],
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: EdgeInsets.only(bottom: 5, right: 10),
                      child: Text(
                        '下单时间: ${_createTimeToString(order.createTime)}',
                        style: TextStyle(color: Color(0xff795548)),
                      ),
                    ))
              ],
            )));
  }

  Widget _createOrderDetail(OrderDetail orderDetail) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0, bottom: 5, top: 5),
      child: Image.network(orderDetail.image, width: 100, height: 100),
    );
  }

  _createTimeToString(DateTime createTime) {
    return '${createTime.year}:${createTime.month}:${createTime.day} ${createTime.hour}:${createTime.minute}:${createTime.second}';
  }
}
