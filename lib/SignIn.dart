import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

////////////////// Login PAGE ////////////////////////////
class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String email = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign In Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              cursorColor: Colors.black,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              decoration: InputDecoration(
                fillColor: Colors.orange.withOpacity(0.1),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                prefixIcon: Icon(Icons.account_circle),
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              obscureText: true,
              cursorColor: Colors.black,
              style: TextStyle(fontSize: 18.0, color: Colors.black),
              decoration: InputDecoration(
                fillColor: Colors.orange.withOpacity(0.1),
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                prefixIcon: Icon(Icons.vpn_key),
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                  email: email,
                  password: password,
                )
                    .then(
                      (firebaseUsers) =>
                      Navigator.pushNamed(context, '/SignOut'),
                )
                    .catchError(
                      (e) => print(e),
                );
              },
              color: Colors.orangeAccent,
              child: Text('Login', style: TextStyle(fontSize: 17.0)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/SignUp');
              },
              color: Colors.orangeAccent,
              child: Text('Sign Up ', style: TextStyle(fontSize: 17.0)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ],
        ),
      ),
    );
  }
}