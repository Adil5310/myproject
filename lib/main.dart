import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:softcard/screens/splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
        builder: (context, snapshot)
        {
            if(snapshot.hasError)
              {
                  print("Something Went Wrong");
              }
            if (snapshot.connectionState == ConnectionState.waiting)
              {
                return const Center(child: CircularProgressIndicator(),);
              }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Soft Card',
                theme: ThemeData(
                  colorScheme: ColorScheme.light().copyWith(primary: Colors.greenAccent),
                  appBarTheme: AppBarTheme(
                    backgroundColor: Colors.greenAccent,
                  ),
                  scaffoldBackgroundColor: Colors.white,

                ),

              home: Splash(),
            );
        }
    );
  }
}

