import 'package:auto_size_text/auto_size_text.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softcard/screens/cardscreens/carddisplay.dart';
import 'package:softcard/screens/cardscreens/cardform.dart';
import '../../constants/customCard.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import '../Drawer.dart';
import '../cardscreens/InvitationCardDisplay.dart';
import '../cardscreens/InvitationCardForm.dart';
import '../cardscreens/editcard.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color color = Colors.grey;

  final Stream<QuerySnapshot> cardStream =
  FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.email??"").snapshots();

  // For Deleting User
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
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Center(
          child: Text(
              'Home Screen'
          ),
        ),

        actions: [
          IconButton(
            onPressed: () {

              // deleteUser(docid);
              AwesomeDialog(
                context: context,
                dialogType: DialogType.QUESTION,
                headerAnimationLoop: false,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Which card you want to create?',
                buttonsTextStyle: TextStyle(color: Colors.black),
                showCloseIcon: true,
                btnOkText: "Business",
                btnCancelText: "Invitation",
                btnCancelOnPress: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => InvitationCardForm(),
                  ),
                  );
                },
                btnOkOnPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CardFoarm(),
                    ),
                  );
                //  Navigator.pop(context);
                },
              ).show();

            }, icon: Icon(Icons.add, ), ),


          // IconButton(onPressed: () {
          //
          //   showDialog(
          //       context: context,
          //
          //       builder: (context) {
          //         return CupertinoAlertDialog(
          //
          //           title: Text('Which card you want to create?'),
          //          // content: Text('Do you really want to delete?'),
          //           actions: <Widget>[
          //             TextButton(
          //                 onPressed: () {
          //                   //action code for "Yes" button
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                       builder: (context) => CardFoarm(),
          //                     ),
          //                   );
          //                   Navigator.pop(context);
          //                 },
          //                 child: Text('Business', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
          //             TextButton(
          //               onPressed: () {
          //                 Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (context) => InvitationCardForm(),
          //                   ),
          //
          //                 );//close Dialog
          //                // Navigator.pop(context);
          //               },
          //               child: Text('Invitation', style: TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),),
          //             )
          //           ],
          //         );
          //       });
          // }, icon: Icon(Icons.add)),
        ]
      ),
      drawer: myDrawer(),
      body:  StreamBuilder<QuerySnapshot>(
          stream: cardStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print('Something went Wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final List storedocs = [];
            snapshot.data!.docs.map((DocumentSnapshot document) {
              Map a = document.data() as Map<String, dynamic>;
              storedocs.add(a);
              a['id'] = document.id;
            }).toList();


            return GridView.builder(

              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 5/ 6,
                crossAxisSpacing: 10,
                mainAxisSpacing: 15,

              ),

              itemBuilder: (context, i) => GridTile(

                child: InkWell(
                  onTap: (){
                    //print(storedocs[i]['cardname']);
                    if (storedocs[i]['username'] != null) {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) =>
                          CardDisplay(name: storedocs[i]['cardname'],
                              username: storedocs[i]['username'],
                              address: storedocs[i]['address'],
                              phonenumber: storedocs[i]['phonenumber'],
                              email: storedocs[i]['useremail'],
                              docid: storedocs[i]['id']
                          ),
                      ),
                      );
                    } else {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) =>
                          InvitationCardDisplay(

                              eventname: storedocs[i]['eventname'],
                              quote: storedocs[i]['quote'],
                              date: storedocs[i]['date'],
                              phonenumber: storedocs[i]['phonenumber'],
                              vanue: storedocs[i]['vanue'],
                              docid: storedocs[i]['id']
                          ),
                      ),
                      );
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)),
                    elevation: 10.0,
                    child: Container(



                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          // This will hold the Image in the back ground:
                          Container(

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.black54),


                          ),
                          // Positioned(
                          //   top : -5,
                          //   child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.start,
                          //       children:[
                          //         IconButton(onPressed: (){AwesomeDialog(
                          //           context: context,
                          //           dialogType: DialogType.QUESTION,
                          //           headerAnimationLoop: false,
                          //           animType: AnimType.BOTTOMSLIDE,
                          //           title: 'Do You want to Delete Card?',
                          //           buttonsTextStyle: TextStyle(color: Colors.black),
                          //           showCloseIcon: true,
                          //           btnCancelOnPress: () {},
                          //           btnOkOnPress: ()  {
                          //             deleteUser(storedocs[i]['id']);
                          //           },
                          //         ).show();}, icon: Icon(Icons.delete, color: Colors.red,)),
                          //         // IconButton(onPressed: (){
                          //         //   print(color);
                          //         //   pickColor(context);
                          //         // }, icon: Icon(Icons.format_color_fill, ))
                          //       ]),
                          // ),

                          Positioned(
                              top: 0,
                              left: 0,

                              child: SvgPicture.asset('assets/svg/ellipse_top_${i%2}.svg', color: Colors.greenAccent)),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: SvgPicture.asset('assets/svg/ellipse_bottom_${i%2}.svg',height: 60, color: Colors.greenAccent, )),
                          Positioned(
                              top: 75,
                              child: SizedBox(
                                width: 75,
                                height: 70,
                                child: AutoSizeText(storedocs[i]['cardname'] ,
                                    style: GoogleFonts.niconne( fontSize: 35, color: Colors.white, fontWeight: FontWeight.bold)),
                              ),
                                 // TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold))
                          ),
                          Positioned(
                            top: 15,
                            left: 7,
                            child: SizedBox(
                              width: 75,
                              height: 70,
                              child: AutoSizeText(storedocs[i]['cardtype'] ,
                                  style: GoogleFonts.actor( fontSize: 20, color: Color(0xFFA07C46), fontWeight: FontWeight.bold)),
                            ),
                            // TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold))
                          ),
                          // This is the Custom Shape Container
                          // Positioned(
                          //   bottom: 0.0,
                          //   left: 0.0,
                          //   child: CustomPaint(
                          //     painter: CustomContainerShapeBorder(
                          //       height: 65.0,
                          //       width: 157.0,
                          //       radius: 30.0,
                          //
                          //     ),
                          //
                          //   ),
                          // ),
                          // This Holds the Widgets Inside the the custom Container;

                        ],
                      ),
                    ),
                  ),
                ),

              ),
              itemCount: snapshot.data?.docs.length,
            );

          }

      ),
    );




  }

  void pickColor(BuildContext context) =>
      showDialog(

          context: context,
          builder: (context) =>
              AlertDialog(

                content: Column(

                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildColorPicker(),
                    FloatingActionButton(child: Text("Select"), onPressed:()=> Navigator.of(context).pop(),),
                  ],
                ),
              )
      );

  buildColorPicker() => ColorPicker(
    pickerColor: color,
    enableAlpha: false,
    showLabel: false,
    onColorChanged: (color)=> setState(() {
      this.color= color;

    }),
  );






}








