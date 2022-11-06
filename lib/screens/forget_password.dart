import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:softcard/screens/login.dart';
class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  var email = "";
  final emailController = TextEditingController();

  @override
  void dispose(){
    emailController.dispose();
    super.dispose();
  }
  resetPassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text(
            "Reset Password email has been sent",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      );
    }
    catch (e){

    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Column(
        children: [
          Text("Reset password link is send to provided email", style: TextStyle(fontSize: 20),),
          Expanded(
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: ListView(
                    children: [
                      Text('Email:', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white70),),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          autofocus: false,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelStyle: TextStyle(fontSize: 20),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.greenAccent, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(60)),),
                            errorStyle: TextStyle(color: Colors.red, fontSize: 20),
                            ),
                          controller: emailController,
                          validator: (value){
                            if(value == null || value.isEmpty){
                                return "Please enter email";
                            } else if (!value.contains('@')){
                              return "please enter valid email";
                            } return null;
                          },
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(onPressed: (){
                              if(_formKey.currentState!.validate()){
                                    setState(() {
                                      email = emailController.text;
                                    });
                                    resetPassword();
                              }
                            },
                                child: Text('Send Enail')),
                            SizedBox(width: 20,),
                            ElevatedButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                               },
                                 child: Text('Login')),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}
