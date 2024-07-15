import 'package:app_ui/page/shoppingCartPage.dart';
import 'package:flutter/material.dart';

import '../component/dishesItem.dart';
import '../component/dishesTypeItem.dart';
import '../model/dishes.dart';
import '../model/dishesType.dart';
import '../state/dishesTypeItemState.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DishesTypeItemState dishesTypeItemState = DishesTypeItemState();

  int selectedIndex = 1;

  List<DishesType> item = [
    DishesType(title: "炒菜", id: 0),
    DishesType(title: "炒菜", id: 0),
    DishesType(title: "炒菜", id: 0),
    DishesType(title: "炒菜", id: 0),
    DishesType(title: "炒菜", id: 0)
  ];
  List<Dishes> dishes = [
    Dishes(
        id: 0,
        title: "番茄炒鸡蛋",
        image:
            "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
    Dishes(
        id: 0,
        title: "番茄炒鸡蛋",
        image:
            "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
    Dishes(
        id: 0,
        title: "番茄炒鸡蛋",
        image:
            "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
    Dishes(
        id: 0,
        title: "番茄炒鸡蛋",
        image:
            "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
    Dishes(
        id: 0,
        title: "番茄炒鸡蛋",
        image:
            "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
    Dishes(
        id: 0,
        title: "番茄炒鸡蛋",
        image:
            "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
    Dishes(
        id: 0,
        title: "番茄炒鸡蛋",
        image:
            "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
    Dishes(
        id: 0,
        title: "番茄炒鸡蛋",
        image:
            "https://th.bing.com/th?id=OIP.gLSfHP-70_4_AT6hRrYzzAHaGK&w=273&h=228&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2"),
  ];

  void selectedIndexFunction(int index) {
    setState(() {
      dishesTypeItemState.setIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE8F5E9),
        title: TextField(
          decoration: const InputDecoration(
            labelText: '查找',
            prefixIcon: Icon(Icons.search),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xff795548),
                width: 2.0,
              ),
            ),
          ),
          onChanged: (value) {},
          onSubmitted: (value) {},
        ),
      ),
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
                  title: item[index].title,
                  index: index,
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
                    itemCount: dishes.length,
                    itemBuilder: (context, index) {
                      return DishesItem(
                          title: dishes[index].title,
                          id: dishes[index].id,
                          image: dishes[index].image);
                    })),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   mini: true,
      //   backgroundColor: Color(0xffFFEB3B),
      //   // elevation: 8.0, // 按钮的海拔（阴影大小）
      //   // focusElevation: 12.0, // 当按钮获得焦点时的海拔
      //   // hoverElevation: 8.0, // 当用户悬停在按钮上时的海拔
      //   onPressed: () {
      //     navigationBarTypeItemState.key.currentState?.setState(() {
      //       navigationBarTypeItemState.setIndex(3);
      //     });
      //   },
      //   child: Icon(Icons.shopping_cart),
      // ),
    );
  }
}
