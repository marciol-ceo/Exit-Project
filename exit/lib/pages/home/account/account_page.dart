import 'package:exit/services/auth.dart';
import 'package:exit/utilis/constants.dart';
import 'package:flutter/material.dart';

import '../home_manager.dart';

class Account extends StatelessWidget{
  Account({this.auth, this.onSignedOut});
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
  Widget build(BuildContext context) {
     void goToHome() {
               Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
               return new Home();
           }));
  }
    return Scaffold(
      endDrawer: new Drawer(),
      appBar: new AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.black),
        actions: <Widget>[
          new Icon(Icons.menu,
                  color: Colors.black,
                  size: 30.0,),
                   new SizedBox(
                      width: 10.0,
                    ),
        ],
        leading: new InkWell(
          onTap: goToHome,
                    child: new Icon(Icons.arrow_back,
                  color: Colors.black,
                  size: 25.0,),
                  ),
                  title: new Text(
                    "vanina_kanga",
                    style: new TextStyle(
                      fontSize: 15.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold ),
                  ),
                ),
                body: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          Container(
                        width: 150,
                        height: 150,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.all(35.0),
                        decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
	                         image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
	                         fit: BoxFit.fill
                       	),
                        )
                      ),
                      new Container(
                        margin: EdgeInsets.only(top: 35, right: 35),
                        alignment: Alignment.topRight,
                      child: new Column(
                        children: <Widget>[
                      new Container(
                        alignment: Alignment.topRight,
                        child: new ButtonTheme(
                      minWidth: 200.0,
                      height: 50.0,
                      child: new RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: kPrimaryColor)
                      ),
                      child: new Text("Modifier le profil",
                        style: new TextStyle(
                          color: kPrimaryColor,
                           fontWeight: FontWeight.bold,
                           fontSize: 20.0,
                           fontFamily: "Monserrat",
                           fontStyle: FontStyle.normal,
                        ),),
                      color: Colors.white, 
                      onPressed: null,
                    ),
                  ),
                        ),
                  new Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 10),
                    child: new Icon(Icons.settings,
                  size: 45.0,
                  color: kPrimaryColor,
                  )
                  ),
                        ],)
                      )
                        ],
                      ),
                     new Container(
                       alignment: Alignment.topLeft,
                       padding: EdgeInsets.only(top: 20,),
                       child: new Text("Kanga Vanina",
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sans Serif",
                      ),
                      ),
                      ),
                       new Container(
                       alignment: Alignment.topLeft,
                       padding: EdgeInsets.only(top: 20,),
                       child: new Text("@vaninakanga",
                      style: new TextStyle(
                        color: Colors.grey,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Sans Serif",
                      ),
                      ),
                      ),
                         new Container(
                       alignment: Alignment.topLeft,
                       padding: EdgeInsets.only(top: 20,right: 50.0),
                       child: new Text("Je suis une fille , rien de plus normal, et toi t'es qui ?",
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 30.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Sans Serif",
                      ),
                      ),
                      ),
                      new Container(
                        child: new Row(
                           children: <Widget>[
                        new Icon(Icons.link,
                        size: 40.0,
                        color: Colors.grey,
                        ),
                        new SizedBox(
                          width: 10.0,
                        ),
                        new Container(
                       alignment: Alignment.topLeft,
                       padding: EdgeInsets.only(top: 20,),
                       child: new Text("vaninakanga.com",
                      style: new TextStyle(
                        color: Colors.blue,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        fontFamily: "Sans Serif",
                      ),
                      ),
                        ),
                           ],
                           ),
                      ),
                      new Container(
                        padding: EdgeInsets.only(left: 25,right: 25),
                        child: new Row(
                          children: <Widget>[
                           new Container(
                             alignment: Alignment.bottomLeft,
                             child:  new Text(
                              "40",
                              style: new TextStyle(
                                color: Colors.black,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),),
                             new Container(
                             alignment: Alignment.bottomRight,
                             child: new Text(
                              "2890",
                              style: new TextStyle(
                                color: Colors.black,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),)
                          ],)
                      )
                    ],
                  ),) 
                );
            }
}