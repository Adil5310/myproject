
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/crudCard.dart';

class CardFoarm extends StatefulWidget {
  CardFoarm({Key? key}) : super(key: key);

  @override
  _CardFoarmState createState() => _CardFoarmState();
}

class _CardFoarmState extends State<CardFoarm> {
  final _formKey = GlobalKey<FormState>();
  var cardName = "";
  var name = "";
  var email = "";
  var number = "00000";
  var address = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final cardNameController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  String user = FirebaseAuth.instance.currentUser?.email??"";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    cardNameController.dispose();
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    addressController.dispose();
    super.dispose();
  }

  AddCard() async {
    create(user, cardName, name, email, number, address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ListView(
                children: [
                  Image.asset('assets/logo.png'),
                  Text('Card Name / Company Name:', style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(fontSize: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.greenAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(60)),),
                        errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: cardNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Card Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Text('Name:', style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(fontSize: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.greenAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(60)),),
                        errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Text('Email:', style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(fontSize: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.greenAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                              Radius.circular(60)),),
                        errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Email';
                        } else if (!value.contains('@')) {
                          return 'Please Enter Valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Text('Number: ', style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelStyle: TextStyle(fontSize: 20.0),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.greenAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(60)),),
                        errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: numberController,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  Text('Address:', style: TextStyle(fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: TextFormField(
                      autofocus: false,

                      style: TextStyle(color: Colors.white),
                      decoration: const InputDecoration(

                        labelStyle: TextStyle(
                            fontSize: 20.0, color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.greenAccent, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(60)),),
                        errorStyle:
                        TextStyle(color: Colors.redAccent, fontSize: 15),
                      ),
                      controller: addressController,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            cardName = cardNameController.text;
                            name = nameController.text;
                            email = emailController.text;
                            number = numberController.text;
                            address = addressController.text;
                          });
                          AddCard();
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.greenAccent,
                          fixedSize: const Size(150, 40),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text(
                        'Save',
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),

                ],
              ),
            )
        )
    );
  }
}