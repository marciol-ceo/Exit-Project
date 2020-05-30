import 'package:exit/pages/home/Home.dart';
import 'package:exit/pages/home/buzzfeed_page.dart';
import 'package:exit/pages/home/makeapost_page.dart';
import 'package:exit/pages/home/messages_page.dart';
import 'package:exit/pages/home/notifications_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//colors
const kPrimaryColor = Color.fromRGBO(246, 14, 14, 10); 

//widgets
Widget _buildAppBarHome(){
    return new AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 2.0,
        actions: <Widget>[
          new InkWell(
          onTap: (){

          },
        child: new Icon(Icons.account_circle,
        color: Colors.white,
        size: 30.0,) ,),
         new SizedBox(
            width: 5.0,
          ),
        ],
        title: new Text(
          "Exit",
          style: new TextStyle(
            fontSize: 30.0,
            color: Colors.white,
            fontWeight: FontWeight.bold ),
        ),
      );
  }

  Widget _buildAppBarBuzzfeed(){
    return new AppBar(
       backgroundColor: kPrimaryColor,
      );
  }

   Widget _buildAppBarMakeAPost(){
    return new AppBar(
       backgroundColor: kPrimaryColor,
      );
  }

  Widget _buildAppBarNotifications(){
    return new AppBar(
        elevation: 2.0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: new Text(
          "Notifications",
          style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
         actions: <Widget>[
          new InkWell(
          onTap: (){

          },
        child: new Icon(Icons.settings,
        color: Colors.white,
        size: 30.0,) ,),
         new SizedBox(
            width: 5.0,
          ),
        ],
      );
  }

  Widget _buildAppBarMessages(){
    return new AppBar(
        elevation: 2.0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: new Text(
          "Messages",
          style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        actions: <Widget>[
          new SizedBox(
            width: 5.0
          ),
          new Icon(Icons.settings,
          color: Colors.white,
          size: 30.0),
          new SizedBox(
            width: 5.0
          ),
          new Icon(Icons.search,
          color: Colors.white,
          size: 30.0)
        ],
      );
  }

  enum AuthStatus{
  signedIn,
  notsigned,
}

  enum IsConnectSince{
  since,
  notSince,
}

//tabs
  final tabsBody = [
    HomePage(),
    BuzzFeed(),
    MakeAPost(),
    Notifications(),
    Messages(),
  ];

  final tabsAppBar = [
     _buildAppBarHome(),
     _buildAppBarBuzzfeed(),
     _buildAppBarMakeAPost(),
     _buildAppBarNotifications(),
     _buildAppBarMessages(),
  ];

