import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:softcard/screens/navbarscreens/homescreen.dart';
import 'package:softcard/screens/login.dart';
import 'package:softcard/screens/signup.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({Key? key}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final email = FirebaseAuth.instance.currentUser?.email;
  User? user = FirebaseAuth.instance.currentUser;
  verifyEmail() async{

    if (user != null && !user!.emailVerified)
    {
      await user?.sendEmailVerification();

      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            "Email has been sent to $user" ,
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );
      setState(() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
      });
    }
  }
  @override

  Widget build(BuildContext context) {
    return Card(
      color: Colors.black45,
      child: Center(
        /** Card Widget **/
        child: SizedBox(
          width: 300,
          height: 500,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [ Image.asset('assets/logo.png'),//CircleAvatar
                SizedBox(
                  height: 20,
                ), //SizedBox
                Text(
                  '$email', style: TextStyle(color: Colors.white, fontSize: 20,),
                ), //Text
                //Text
                const SizedBox(
                  height: 50,
                ), //SizedBox
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      verifyEmail();

                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                        fixedSize: const Size(150, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      'Verify Email',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ), //Padding
                ),

                const SizedBox(
                  height: 10,
                ),
                Container(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Signup()));

                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.greenAccent,
                        fixedSize: const Size(150, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                    child: const Text(
                      'Close',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),

                  //Padding
                )//SizedBox
              ],
            ), //Column
          ), //Padding
        ), //Card
      ), //Center
    );
  }
}