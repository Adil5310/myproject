
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';



create( String usercard, String cardname, String username, String useremail, String phonenumber, String address) async {

  await FirebaseFirestore
      .instance.collection(usercard)
      .doc(cardname)
      .set({
    'cardtype' : "BC",
    "cardname" : cardname,
    'username': username,
    'useremail': useremail,
    'phonenumber': phonenumber,
    'address': address,

  });

  print("data Uploaded");
}

InvitationCardCreation( String usercard, String eventcardname, String eventname, String quote, String phonenumber, String venue, String date) async {

  await FirebaseFirestore
      .instance.collection(usercard)
      .doc(eventcardname)
      .set({
    'cardtype' : "IC",
    "cardname" : eventcardname,
    'eventname': eventname,
    'quote': quote,
    'phonenumber': phonenumber,
    'date' : date,
    'vanue': venue,
    'date' : date,

  });

  print("data Uploaded");
}
