import 'dart:async';

import 'package:app_ui/page/shoppingCartPage.dart';
import 'package:app_ui/state/dishesItemState.dart';
import 'package:app_ui/state/stateStream.dart';
import 'package:flutter/material.dart';

import '../component/dishesItem.dart';
import '../component/dishesTypeItem.dart';
import '../model/dishes.dart';
import '../model/dishesType.dart';
import '../model/group.dart';
import '../state/dishesTypeItemState.dart';

class GroupPage extends StatefulWidget {
  GroupPage({super.key});

  @override
  State<GroupPage> createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  Group group = Group(id: 0, name: '1');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE8F5E9),
        title: Text('分组'),
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
      body: Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Row(children: [
              Text('已加入分组：${group.name}'),
              TextButton(onPressed: () {

              }, child: Text('设置分组'))
            ]),
          )),
    );
  }
}
