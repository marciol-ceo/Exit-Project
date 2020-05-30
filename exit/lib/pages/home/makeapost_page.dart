import 'dart:io';
import 'dart:async';
import 'package:exit/utilis/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:intl/date_symbol_data_local.dart';

class MakeAPost extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MakeAPost();
  }

}

class _MakeAPost extends State<MakeAPost>{
  @override
  void initState() {
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: new AppBar(
        centerTitle: false,
        elevation: 10.0,
        backgroundColor: Colors.white,
        title: new Text("Faites une note vocale",
          style: new TextStyle(
            color: Colors.black,
            fontSize: 17.0,
            fontWeight: FontWeight.bold
          )),
        leading: new Icon(Icons.close , 
        color: Colors.black,
        size: 30.0)
      ),
      body: ListView(
        ),
    );
  }
}