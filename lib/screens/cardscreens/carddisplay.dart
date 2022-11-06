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
import 'package:softcard/screens/cardscreens/editcard.dart';
class CardDisplay extends StatefulWidget {
  final name;
  final username;
  final address;
  final phonenumber;
  final email;
  final docid;
   CardDisplay({Key? key, this.name, this.username, this.address, this.phonenumber,this.email, this.docid}) : super(key: key);

  @override
  _CardDisplayState createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
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
  String get name => super.widget.name;
 String get username => super.widget.username;
 String get email => super.widget.email ?? "";
 String get phonenumber => super.widget.phonenumber ?? "xxxxxxx";
 String get address => super.widget.address ?? "-------";
  String get docid => super.widget.docid ?? "-------";
  @override
  Widget build(BuildContext context) {
  //  List <String> backgroundColors = {"0xFF1E1E99" , "0xFFFF70A3"} as List<String>;
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("$name")),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (
                context) =>
                UpdateCard(id: docid,),
            ),
            );
          }, icon: Icon(Icons.edit)),
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
                    child: Image.asset('assets/cards/BC1.jpeg'),
                  ),
                  Row(
                    children: [
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 161.0, top: 31),
                      //   child: Icon(Icons.person),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(top: 22, left: 165),
                        child: Text('$username', style: GoogleFonts.audiowide(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold , ),
                       // TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold , ),
                        ),
                      ),
                    ],

                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 67.0, left: 180),
                        child: Text('+92$phonenumber', style: TextStyle(color: Colors.white, fontSize: 14,  ),),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0, left: 190),
                        child: Text('$email', style: TextStyle(color: Colors.white, fontSize: 12,  ),),
                      ),
                    ],
                  ),
                  Row(
                    children: [

                      Padding(
                        padding: const EdgeInsets.only(top: 128.0, left: 183),
                        child: Text('www.example.com', style: TextStyle(color: Colors.white, fontSize: 14,  ),),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: 156.0, left: 196),
                  //       child: Expanded(
                  //         child: AutoSizeText('$address', maxLines: 2,overflow: TextOverflow.ellipsis,
                  //           style: TextStyle(color: Colors.white,   ),),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Container(
                    child: Row(
                      children: [
                        Flexible(
                          child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 160.0, left: 172),
                                  child: Text("$address", style: TextStyle(color: Colors.white, ),
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
