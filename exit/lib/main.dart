import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exit/pages/authenfication/login_page.dart';
import 'package:exit/pages/wrapper.dart';
import 'package:exit/services/auth.dart';
import 'package:exit/pages/authenfication/signin_page.dart';
import 'package:exit/services/auth.dart';
import 'package:exit/utilis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exit',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(title: "Exit",)
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Wrapper(auth: new Auth()),
    );
  }
}
