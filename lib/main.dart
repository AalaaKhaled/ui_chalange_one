import 'package:flutter/material.dart';
import 'package:ui_chalange_one/transfer.dart';
import 'home.dart';

int _selectedItemIndex = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          BottomNavBarButton(
            icon: Icons.home,
            onTap: () {
              setState(() {
                _selectedItemIndex = 0;
              });
            },
            index: 0,
          ),
          BottomNavBarButton(
            icon: Icons.card_giftcard,
            onTap: () {
              setState(() {
                _selectedItemIndex = 1;
              });
            },
            index: 1,
          ),
          BottomNavBarButton(
            icon: Icons.crop_square,
            onTap: () {
              setState(() {
                _selectedItemIndex = 2;
              });
            },
            index: 2,
          ),
          BottomNavBarButton(
            icon: Icons.pie_chart,
            onTap: () {
              setState(() {
                _selectedItemIndex = 3;
              });
            },
            index: 3,
          ),
          BottomNavBarButton(
            icon: Icons.person,
            onTap: () {
              setState(() {
                _selectedItemIndex = 4;
              });
            },
            index: 4,
          ),
        ],
      ),
      body: selectBody(_selectedItemIndex),
      // TransferPage(),
    );
  }

  Widget selectBody(int index) {
    if (index == 0) {
      return HomePage();
    } else if (index == 4) {
      return TransferPage();
    } else {
      return HomePage();
    }
  }
}

class BottomNavBarButton extends StatelessWidget {
  final IconData icon;
  final int index;
  final Function onTap;
  BottomNavBarButton({this.icon, this.index, this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 5,
        decoration: index == _selectedItemIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 4,
                    color: Color(0xFF00B686),
                  ),
                ),
                gradient: LinearGradient(colors: [
                  Color(0xFF00B686).withOpacity(0.1),
                  Color(0xFF00B686).withOpacity(0.016)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedItemIndex ? Color(0xFF00B686) : Colors.grey,
        ),
      ),
    );
  }
}
