import 'package:app_ui/page/homePage.dart';
import 'package:app_ui/page/profilePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          _createCustomBottomNavigationBarItem(Icons.home, '菜单', 0),
          _createCustomBottomNavigationBarItem(Icons.person, '我的', 2),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff2e7d32),
        unselectedItemColor: const Color(0xff4caf50),
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem _createCustomBottomNavigationBarItem(
      IconData icon, String title, int index) {
    return BottomNavigationBarItem(icon: Icon(icon), label: title);
  }
}
