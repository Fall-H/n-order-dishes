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
              TextButton(
                  onPressed: () {
                    showCustomDialog();
                  },
                  child: Text('设置分组'))
            ]),
          )),
    );
  }

  void showCustomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('输入分组'),
          content: TextFormField(
            decoration: InputDecoration(
              labelText: '分组编码',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '请输入分组编码';
              }
              return null;
            },
            onSaved: (value) {
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('提交'),
              onPressed: () {
                final form =
                    ModalRoute.of(context)?.settings.arguments as FormState;
                if (form == null) return;
                form.save();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
