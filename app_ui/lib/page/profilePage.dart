import 'package:app_ui/page/orderDetailPage.dart';
import 'package:app_ui/page/shoppingCartPage.dart';
import 'package:app_ui/state/dishesItemState.dart';
import 'package:flutter/material.dart';

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
          Container(
              color: Color(0xFFE8F5E9),
              padding: EdgeInsets.all(30),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _createAvatar(),
                  Text("未登录",
                      style: TextStyle(color: Color(0xff795548), fontSize: 20))
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _createIconButton(Icons.receipt, "订单", () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => OrderDetailPage()));
              }),
              _createIconButton(Icons.shopping_cart, "购物车", () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ShoppingCartPage()));
              }),
              _createIconButton(Icons.group, "分组", () {}),
            ],
          )
        ],
      ),
    );
  }

  Container _createAvatar() {
    return Container(
      width: 60,
      height: 60,
      color: Colors.red,
      margin: EdgeInsets.only(right: 20),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(20.0), // 设置圆角大小
      //   color: Colors.black, // 背景颜色，如果图片加载失败时显示
      //   image: DecorationImage(
      //     image: NetworkImage("https://tse2-mm.cn.bing.net/th/id/OIP-C.Jsk1TYEwazwX0_amBpjG-QHaJP?w=134&h=180&c=7&r=0&o=5&pid=1.7"),
      //     fit: BoxFit.cover, // 适应图片
      //   ),
      // ),
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
}
