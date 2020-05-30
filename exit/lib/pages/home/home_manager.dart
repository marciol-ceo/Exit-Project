import 'package:exit/pages/home/Home.dart';
import 'package:exit/utilis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:exit/services/auth.dart';
import 'buzzfeed_page.dart';
import 'makeapost_page.dart';
import 'messages_page.dart';
import 'notifications_page.dart';

class MyHome extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      title: 'Exit',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new Home(title: "Exit",)
    );
  }

}

class Home extends StatefulWidget{
  Home({Key key, this.title, this.auth, this.onSignedOut}) : super(key: key);
  final String title;
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  void signedOut() async{
    try {
      await auth.signoutOut();
      onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  _Home createState() => _Home();

}
class _Home extends State<Home> {
  int _cIndex = 1;
  void _incrementBottomTabBar(index){
    setState(() {
      _cIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: null,
      body: new Center(
        child: tabsBody[_cIndex],
      ),
      bottomNavigationBar: new Theme(
    data: Theme.of(context).copyWith(
        canvasColor: Colors.white,
        primaryColor: Colors.red,
    ),
       child: new BottomNavigationBar(
         selectedFontSize: 0.0,
         unselectedFontSize: 0.0,
        currentIndex: _cIndex,
        backgroundColor: Colors.white,
        elevation: 0.0,
        type: BottomNavigationBarType.shifting,
        onTap: (index){
          _incrementBottomTabBar(index);
          if(index == 2){
            Navigator.of(context,rootNavigator: true).push(new MaterialPageRoute(builder: 
            (BuildContext context){
             return new MakeAPost();  
           })
            );
          }
        },
        items: [
        BottomNavigationBarItem(
          icon: _cIndex==0 ? new Icon(Icons.home,
          size: 37.0,
          color: kPrimaryColor,):new Icon(Icons.home,
          size: 20.0,
          color: Colors.black,),
          title: new Text("")),
          BottomNavigationBarItem(
          icon:  _cIndex==1 ? new Icon(Icons.search,
          size: 37.0,
          color: kPrimaryColor,):new Icon(Icons.search,
          size: 20.0,
          color: Colors.black,),
          title: new Text(""),
         ),
          BottomNavigationBarItem(
          icon:  _cIndex==2 ? new Icon(Icons.mic,
          size: 37.0,
          color: kPrimaryColor,):new Icon(Icons.mic,
          size: 20.0,
          color: Colors.black,),
          title: new Text("")),
          BottomNavigationBarItem(
          icon:  _cIndex==3 ? new Icon(Icons.notifications,
          size: 37.0,
          color: kPrimaryColor,):new Icon(Icons.notifications,
          size: 20.0,
          color: Colors.black,),
          title: new Text("")),
          BottomNavigationBarItem(
          icon:  _cIndex==4 ? new Icon(Icons.mail,
          size: 37.0,
          color: kPrimaryColor,):new Icon(Icons.mail,
          size: 20.0,
          color: Colors.black,),
          title: new Text(""))
      ]
      ,),
    ));
  }
}