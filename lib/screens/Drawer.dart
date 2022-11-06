
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'navbarscreens/homescreen.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            accountName: Text("Soft Card", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            accountEmail: Text("softcard@gmail.com",),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  "assets/logo.png"),
            ),
            decoration: BoxDecoration(
              color: Color(0xFF3F434C),
            ),
            otherAccountsPictures: [
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/74.jpg"),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/men/47.jpg"),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("About"),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.grid_3x3_outlined),
            title: Text("Products"),
            onTap: () {

            },
          ),
          ListTile(
            leading: Icon(Icons.contact_mail),
            title: Text("Contact"),
            onTap: () {

            },
          )
        ],
      ),
    );
  }
}