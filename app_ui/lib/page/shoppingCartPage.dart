import 'package:flutter/material.dart';

import '../component/dishesItem.dart';
import '../component/dishesTypeItem.dart';
import '../model/dishes.dart';
import '../model/dishesType.dart';
import '../state/dishesItemState.dart';
import '../state/dishesTypeItemState.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPage();
}

class _ShoppingCartPage extends State<ShoppingCartPage> {
  DishesItemState dishesItemState = DishesItemState();

  List<Dishes> list = [];

  @override
  void initState() {
    super.initState();
    dishesItemState.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    // dishesItemState.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE8F5E9),
        title: Text('购物车'),
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
      body: Stack(children: [
        ListView.builder(
            itemCount: dishesItemState.getList().length,
            itemBuilder: (context, index) {
              return DishesItem(dishes: dishesItemState.getList()[index]);
            }),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xffFFEB3B))),
                  child: const Text("结算", style: TextStyle(color: Color(0xff795548)),),
                )))
      ]),
    );
  }
}
