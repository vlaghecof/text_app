import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:text_app/myHomePage.dart';
import 'package:text_app/textInputWidget.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Hello World!"))),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click() {
    signInWithGoogle().then((user) => {
          this.user = user,
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(user.displayName)))
        });
  }

  void defaultUser() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MyHomePage("Default")));
  }

  Widget googleLoginButton() {
    return OutlineButton(
      onPressed: this.click,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      splashColor: Colors.grey,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/google_logo.png'),
              height: 35,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Sign in with Google ",
                style: TextStyle(color: Colors.grey, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          googleLoginButton(),
          Text(
            " Or as ",
            style: TextStyle(color: Colors.grey, fontSize: 25),
          ),
          RaisedButton(
            child: Text(
              'Default User ',
              style: TextStyle(fontSize: 20.0),
            ),
            onPressed: defaultUser,
            padding: EdgeInsets.all(8.0),
            color: Colors.blue,
          ),
        ],
      ),
    );

    //    return Align(
//      alignment: Alignment.center,
//      child: googleLoginButton(),
//    );
  }
}
