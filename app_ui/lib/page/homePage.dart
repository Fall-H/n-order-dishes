import 'package:flutter/material.dart';

import '../component/disherItem.dart';
import '../component/dishesTypeItem.dart';
import '../state/dishesTypeItemState.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DishesTypeItemState dishesTypeItemState = DishesTypeItemState();

  int selectedIndex = 1;

  List<int> item = [1, 2, 4, 5, 6];

  void selectedIndexFunction(int index) {
    setState(() {
      dishesTypeItemState.setIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: ListView.builder(
              // padding: const EdgeInsets.only(
              //   top: 5.0,
              //   bottom: 5.0,
              // ),
              itemCount: item.length,
              itemBuilder: (context, index) {
                return DishesTypeItem(
                  title: item[index].toString(),
                  index: item[index],
                  backFunction: (index) => selectedIndexFunction(index),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
                color: Color(0xFFE8F5E9),
                child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return DishesItem(
                          title: '番茄炒鸡蛋',
                          index: 1,
                          image:
                              'https://static.binschool.app/images/solidity-basic-v6.jpg');
                    })),
          ),
        ],
      ),
    );
  }
}
