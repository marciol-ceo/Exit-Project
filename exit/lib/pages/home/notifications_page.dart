import 'package:exit/utilis/constants.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Notifications();
  }

}

class _Notifications extends State<Notifications>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 2.0,
        leading: new Icon(Icons.settings,
        color: Colors.white,
        size: 0.0,),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: new Text(
          "Notifications",
          style: new TextStyle(
           fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: "Sans Serif",
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      body: new Center(

      ),
    );
  }
}