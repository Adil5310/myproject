
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../services/crudCard.dart';

class InvitationCardForm extends StatefulWidget {
  InvitationCardForm({Key? key}) : super(key: key);

  @override
  _InvitationCardFormState createState() => _InvitationCardFormState();
}

class _InvitationCardFormState extends State<InvitationCardForm> {
  final _formKey = GlobalKey<FormState>();
  var eventcardName = "";
  var eventname = "";
  var quote = "";
  var number = "00000";
  var vanue = "";
  var date = "";

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final eventcardNameController = TextEditingController();
  final eventnameController = TextEditingController();
  final quoteController = TextEditingController();
  final numberController = TextEditingController();
  final vanueController = TextEditingController();
  final dateController = TextEditingController();
  String user = FirebaseAuth.instance.currentUser?.email??"";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    eventcardNameController.dispose();
    eventnameController.dispose();
    quoteController.dispose();
    numberController.dispose();
    vanueController.dispose();
    dateController.dispose();
    super.dispose();
  }

  AddCard() async {
    InvitationCardCreation(user, eventcardName, eventname, quote,  number, vanue, date,);
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
                  Text('Event Card Name:', style: TextStyle(fontSize: 20,
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
                      controller: eventcardNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Event Card Name';
                        }
                        return null;
                      },
                    ),
                  ),
                  Text('Event Name:', style: TextStyle(fontSize: 20,
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
                      controller: eventnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Event name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Text('Quote:', style: TextStyle(fontSize: 20,
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
                      controller: quoteController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter quote about event';
                        }
                        return null;
                      },
                    ),
                  ),
                  const Text('Event Date:', style: TextStyle(fontSize: 20,
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
                      controller: dateController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter event date';
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
                  Text('Vanue:', style: TextStyle(fontSize: 20,
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
                      controller: vanueController,
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
                            eventcardName = eventcardNameController.text;
                            eventname = eventnameController.text;
                            quote = quoteController.text;
                            number = numberController.text;
                            vanue = vanueController.text;
                            date = dateController.text;
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
                        'Create Invitation Card',
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