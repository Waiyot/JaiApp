import 'package:flutter/material.dart';
import 'package:jai_app/screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  // Explicit
  double mylenght = 160.0;
  double h1 = 36.0;
  double h2 = 18.0;

  // Method

  Widget signInButton() {
    return Expanded(
      child: RaisedButton(
        color: Colors.green[800],
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget signUpButton() {
    return Expanded(
      child: OutlineButton(
        child: Text('Sigh Up'),
        onPressed: () {
          print('You Click Sign Up');

          //Creat Route
          var registerRoute =
              MaterialPageRoute(builder: (BuildContext context) => Register());
              Navigator.of(context).push(registerRoute);
        },
      ),
    );
  }

  Widget showButton() {
    return Container(
      width: 250.0,
      child: Row(
        children: <Widget>[
          signInButton(),
          mySizeBox(),
          signUpButton(),
        ],
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          labelStyle: TextStyle(color: Colors.green[900]),
          hintText: 'yours@yahoo.com',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password :',
          labelStyle: TextStyle(color: Colors.green[900]),
          hintText: 'More 6 Characters',
        ),
      ),
    );
  }

  Widget mySizeBox() {
    return SizedBox(
      height: 16.0,
      width: 4.0,
    );
  }

  Widget showLogo() {
    return Container(
      width: mylenght,
      height: mylenght,
      child: Image.asset(
        'images/logo_movie.png',
      ),
    );
  }

  Widget showAppName() {
    return Text(
      'Jai App',
      style: TextStyle(
          fontSize: h1,
          color: Colors.green[900],
          fontWeight: FontWeight.bold,
          fontFamily: 'Trirong'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.green[200]],
            begin: Alignment.topLeft,
          ),
        ),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            mySizeBox(),
            showAppName(),
            emailText(),
            passwordText(),
            mySizeBox(),
            showButton(),
          ],
        ),
      ),
    );
  }
}
