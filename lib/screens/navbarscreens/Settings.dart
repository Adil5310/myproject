import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../constants/customCard.dart';
import '../Drawer.dart';
import '../login.dart';
import 'bottomnavbar.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center(
          child: Text(
              'Settings Screen'
          ),
        ),
        actions: [
          IconButton(onPressed: () {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.QUESTION,
              headerAnimationLoop: false,
              animType: AnimType.BOTTOMSLIDE,
              title: 'Do You want to sign out?',
              buttonsTextStyle: TextStyle(color: Colors.black),
              showCloseIcon: true,
              btnCancelOnPress: () {},
              btnOkOnPress: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ), (route) => false);
              },
            ).show();
          }, icon: Icon(Icons.logout)),
        ],
      ),
      drawer: myDrawer(),
      body:   Center(
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0)),
          elevation: 10.0,
          child: Container(
            width: 200.0,
            height: 250.0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // This will hold the Image in the back ground:
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.pink[100]),
                ),
                // This is the Custom Shape Container
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Container(
                    color: Colors.red,
                    child: CustomPaint(
                      painter: CustomContainerShapeBorder(
                        height: 80.0,
                        width: 200.0,
                        radius: 50.0,
                      ),
                    ),
                  ),
                ),
                // This Holds the Widgets Inside the the custom Container;

              ],
            ),
          ),
        ),

      ),
    );
  }
}
