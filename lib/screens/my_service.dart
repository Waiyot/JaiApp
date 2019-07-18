import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
//Explicit

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameDisplay = ' ';

// Method
  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameDisplay = firebaseUser.displayName;
      print('nameDisplay = $nameDisplay');
    });
  }

  Widget showName() {
    return Text('Login by $nameDisplay');
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo_movie.png'),
    );
  }

  Widget showHeadDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.green[100],
      ),
      child: Column(
        children: <Widget>[
          showLogo(),
          showName(),
        ],
      ),
    );
  }

  Widget signOutButton() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('Sign Out and Exit'),
      onTap: () {
        signOutProcess();
      },
    );
  }

  Future<void> signOutProcess() async {
    await firebaseAuth.signOut().then((response) {
      myCloseApp();
    });
  }

  void myCloseApp() {
    exit(0);
  }

  Widget menuDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          showHeadDrawer(),
          signOutButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('My Service'),
      ),
      body: Text('body'),
      drawer: menuDrawer(),
    );
  }
}
