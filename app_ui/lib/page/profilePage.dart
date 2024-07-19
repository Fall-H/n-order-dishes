import 'package:app_ui/page/groupPage.dart';
import 'package:app_ui/page/orderDetailPage.dart';
import 'package:app_ui/page/shoppingCartPage.dart';
import 'package:app_ui/state/dishesItemState.dart';
import 'package:flutter/material.dart';

import 'orderPage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          InkWell(
              onTap: () {
                showLoginDialog();
              },
              child: Container(
                  color: Color(0xFFE8F5E9),
                  padding: EdgeInsets.all(30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _createAvatar(),
                      Text("未登录",
                          style:
                              TextStyle(color: Color(0xff795548), fontSize: 20))
                    ],
                  ))),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _createIconButton(Icons.receipt, "订单", () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => OrderPage()));
              }),
              _createIconButton(Icons.shopping_cart, "购物车", () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ShoppingCartPage()));
              }),
              _createIconButton(Icons.group, "分组", () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => GroupPage()));
              }),
            ],
          )
        ],
      ),
    );
  }

  Container _createAvatar() {
    return Container(
      width: 80,
      height: 80,
      // color: Colors.red,
      margin: EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // 设置圆角大小
        color: Colors.black, // 背景颜色，如果图片加载失败时显示
        image: DecorationImage(
          image: NetworkImage(
              "https://img2.baidu.com/it/u=3331256125,1399579581&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=556"),
          fit: BoxFit.cover, // 适应图片
        ),
      ),
    );
  }

  Widget _createIconButton(
      IconData icon, String title, VoidCallback onPressed) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.all(20),
        child: TextButton(
            onPressed: onPressed,
            child: Column(
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Color(0xff795548),
                ),
                Text(
                  title,
                  style: TextStyle(color: Color(0xff795548)),
                )
              ],
            )),
      ),
    );
  }

  void showLoginDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('登录'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: '用户名',
                  border: OutlineInputBorder(),
                ),
                autofocus: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入用户名';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '密码',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入密码';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('登录'),
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
