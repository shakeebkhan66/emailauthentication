import 'package:flutter/material.dart';
import 'SignIn.dart';
import 'SignUp.dart';
import 'SignOut.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
      home: SignInPage(),
      routes: {
        // '/SignUP': (context) => SignUp(),
        // ======== OR we can Write ======== //
        '/SignIn': (_) => SignInPage(),
        '/SignUp': (_) => SignUpPage(),
        '/SignOut': (_) => SignOutPage(),
      },
    );
  }
}