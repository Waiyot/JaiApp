import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Explicit

  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;



// Method

  Widget nameText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        style: TextStyle(
          color: Colors.blue,
        ),
        decoration: InputDecoration(
          labelText: 'Name :',
          labelStyle: TextStyle(
            color: Colors.blue,
          ),
          helperText: 'Type Display Name',
          helperStyle: TextStyle(
            color: Colors.blue,
          ),
          icon: Icon(
            Icons.face,
            size: 36.0,
            color: Colors.blue,
          ),
        ), validator: (String value){
          if (value.isEmpty) {
            return 'Please enter your name';
          }
        }, onSaved: (String value){
          nameString = value;
        },
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          color: Colors.orange,
        ),
        decoration: InputDecoration(
          labelText: 'Email :',
          labelStyle: TextStyle(
            color: Colors.orange,
          ),
          helperText: 'Type Your Email',
          helperStyle: TextStyle(
            color: Colors.orange,
          ),
          icon: Icon(
            Icons.email,
            size: 36.0,
            color: Colors.orange,
          ),
        ), validator: (String value) {
          if (!((value.contains('@')) && (value.contains('.')))) {
            return 'Please Type your@email.com';
          }
        }, onSaved: (String value){
            emailString = value;
        },
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextFormField(
        style: TextStyle(
          color: Colors.purple,
        ),
        decoration: InputDecoration(
          labelText: 'Password :',
          labelStyle: TextStyle(
            color: Colors.purple,
          ),
          helperText: 'Please Type Your Password',
          helperStyle: TextStyle(
            color: Colors.purple,
          ),
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.purple,
          ),
        ), validator: (String value){
            if (value.length <6){
              return 'Please enter password more 6 characters';
            }
        }, onSaved: (String value){
          passwordString = value;
        },
      ),
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Click Upload');

        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $nameString, email = $emailString, password = $passwordString');
        }

      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('Register'),
        actions: <Widget>[
          uploadButton(),
        ],
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 60.0),
        child: Form(key: formKey,
          child: Column(
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
