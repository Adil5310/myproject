import 'package:flutter/material.dart';

import '../Drawer.dart';
import 'bottomnavbar.dart';
class Moretab extends StatefulWidget {
  const Moretab({Key? key}) : super(key: key);

  @override
  _MoretabState createState() => _MoretabState();
}

class _MoretabState extends State<Moretab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center(
          child: Text(
              'More Screen'
          ),
        ),

      ),
      drawer: myDrawer(),
      body: Center(
        child: const Text("More SCREEN" ,
          style: TextStyle(
              color: Colors.white70,
              fontSize: 30,fontWeight:
          FontWeight.bold),
        ),
      ),

    );
  }
}
