import 'package:exit/utilis/constants.dart';
import 'package:flutter/material.dart';

class Messages extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Messages();
  }

}

class _Messages extends State<Messages>{
  int _cIndex = 0;

  void _incrementBottomTabBar(index){
    setState(() {
      _cIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 2.0,
        leading:  new Icon(Icons.settings,
          color: Colors.white,
          size: 25.0),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: new Text(
          "Messages",
          style: new TextStyle(
           fontSize: 18.0,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: "Sans Serif",
            fontStyle: FontStyle.normal,
          ),
        ),
        actions: <Widget>[
          new Icon(Icons.search,
          color: Colors.white,
          size: 25.0),
                   new SizedBox(
            width: 10.0
          ),
        ],
      ),
      body: new Container(
        padding: EdgeInsets.only(left:35.0),
          alignment: Alignment.center,
          child: new Text("Vous n'avez aucune conversation pour l'instant.",
        style: new TextStyle(
          color: Colors.grey,
          fontSize: 25.0),
          ),
        )
    );
  }
}