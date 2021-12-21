import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_messenger/screens/home.dart';
import 'package:my_messenger/screens/welcome_screen.dart';
import 'package:my_messenger/services/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyMessenger());
}

class MyMessenger extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot) {
          if(snapshot.hasData) {
            return Home();
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
