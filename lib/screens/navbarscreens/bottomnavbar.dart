import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'OCRscreen.dart';
import 'Settings.dart';
import 'contactsScreen.dart';
import 'homescreen.dart';
import 'more.dart';
class BottomNavbar extends StatefulWidget {
  const BottomNavbar({Key? key}) : super(key: key);

  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _page = 2;
  final screen = [ContactScreen(),OCR(), HomeScreen(),  Settings() ];
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 50.0,
        items: const <Widget>[
          Icon(Icons.supervisor_account_sharp, size: 30,color: Colors.white, ),
          Icon(Icons.document_scanner, size: 30,color: Colors.white,),
          Icon(Icons.credit_card_sharp, size: 30,color: Colors.white,),
          Icon(Icons.settings, size: 30,color: Colors.white,),
        ],
        color: Colors.greenAccent,
        buttonBackgroundColor: Colors.greenAccent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });

        },

      ),
      body: screen[_page],
    );
  }
}
