import 'package:flutter/material.dart';

import '../Drawer.dart';
import 'bottomnavbar.dart';
class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Center(
          child: Text(
              'Contacts Screen'
          ),
        ),

      ),
      drawer: myDrawer(),
      body: Center(
        child: const Text(
          "Contacts SCREEN" ,
          style: TextStyle(
              color: Colors.white70,
              fontSize: 30,fontWeight:
          FontWeight.bold),
        ),
      ),
    );
  }
}
