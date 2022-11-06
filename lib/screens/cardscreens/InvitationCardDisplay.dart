import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share/share.dart';
import 'package:share_files_and_screenshot_widgets/share_files_and_screenshot_widgets.dart';
class InvitationCardDisplay extends StatefulWidget {
  final eventname;
  final quote;
  final phonenumber;
  final date;
  final vanue;
  final docid;
 InvitationCardDisplay({Key? key, this.eventname, this.quote, this.date, this.phonenumber,this.vanue, this.docid}) : super(key: key);

  @override
  _InvitationCardDisplayState createState() => _InvitationCardDisplayState();
}

class _InvitationCardDisplayState extends State<InvitationCardDisplay> {
  late Image _image ;

  GlobalKey previewContainer = new GlobalKey();
  int originalSize = 800;
  CollectionReference Cards =
  FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.email??"");
  Future<void> deleteUser(id) {
    // print("User Deleted $id");
    return Cards
        .doc(id)
        .delete()
        .then((value) => print('User Deleted'))
        .catchError((error) => print('Failed to Delete user: $error'));
  }
  @override
  // TODO: implement widget
  final _ScreenShotController = ScreenshotController();
  List<Color> backgraoundcolors = [Color(0xFF1E1E99) , Color(0xFFFF70A3)];
  String get name => super.widget.eventname;
  String get quote => super.widget.quote;
  String get date => super.widget.date;
  String get phonenumber => super.widget.phonenumber ?? "xxxxxxx";
  String get address => super.widget.vanue ?? "-------";
  String get docid => super.widget.docid ?? "-------";
  @override
  Widget build(BuildContext context) {
    //  List <String> backgroundColors = {"0xFF1E1E99" , "0xFFFF70A3"} as List<String>;
    return Scaffold(
      appBar: AppBar(
        title: Text("Invitation Card"),
        actions: [
          Container(

            child: IconButton(
              onPressed: () {

                // deleteUser(docid);
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.QUESTION,
                  headerAnimationLoop: false,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Do You want to Delete Card?',
                  buttonsTextStyle: TextStyle(color: Colors.black),
                  showCloseIcon: true,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    deleteUser(docid);
                    Navigator.pop(context);
                  },
                ).show();

              }, icon: Icon(Icons.delete, color: Colors.white, size: 30,), ),
          ),

        ],
      ),
      body:  Column(
        children: [
          SizedBox(height: 50,),
          RepaintBoundary(
            key: previewContainer,
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Image.asset('assets/cards/IC1.jpeg'),
                ),

                Container(
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 55.0 , left: 55, right: 55),
                              child: Text('$name', style: GoogleFonts.lobster(color: Colors.black, fontSize: 35, fontWeight: FontWeight.bold , ),
                                // TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold , ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Column(

                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 135.0 , left: 55, right: 25),
                              child: Text('$quote', style: GoogleFonts.lobster(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold , ),
                                // TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold , ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],

                  ),
                ),

                // Row(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(top: 6.0, left: 180),
                //       child: Text(phonenumber, style: TextStyle(color: Colors.white, fontSize: 14,  ),),
                //     ),
                //   ],
                // ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 250.0, left: 100, right: 55),
                      child: Text('$date' + " | " + '8 pm', style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 15,  ),),
                    ),
                  ],
                ),

                Row(
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 270.0, left: 100),
                      child: Expanded(
                        child: AutoSizeText('$phonenumber', maxLines: 2,overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold   ),),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 290.0, left: 100),
                              child: Text("$address", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold ),
                              ),
                            ),
                          ],

                        ),
                      ) ,
                    ],
                  ),
                ),
              ],
            ),
          ),

        ],


      ),
      floatingActionButton : FloatingActionButton(
          child: Icon(Icons.share),
          onPressed: () {
            ShareFilesAndScreenshotWidgets().shareScreenshot(
                previewContainer,
                originalSize,
                "Title",
                "Name.png",
                "image/png",
                text: "This is the caption!");
          }),
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      // ShareFilesAndScreenshotWidgets()
      //     .takeScreenshot(previewContainer, originalSize)
      //     .then((  value) {
      //       setState(() {
      //        _image = value!;
      //          });
      //     });
      //          },
      //     tooltip: 'Increment',
      //     child: const Icon(Icons.add),
      //   ),

    );

  }
  void _takeScreenshot() async {
    final imageFile = await _ScreenShotController.capture();
    Share.share("Hello");
    print("Screen Shoot");
  }
}
