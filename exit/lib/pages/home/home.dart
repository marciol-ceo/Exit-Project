import 'package:exit/pages/home/account/account_page.dart';
import 'package:exit/services/auth.dart';
import 'package:exit/utilis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _HomePage();
  }

}
class _HomePage extends State<HomePage> {
  AuthStatus authStatus = AuthStatus.notsigned;
  void onSignedOut(){
    setState(() {
      authStatus = AuthStatus.notsigned;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      backgroundColor: Colors.white,
      iconTheme: new IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 2.0,
        actions: <Widget>[
          new InkWell(
          onTap: goToAccount,
                  child: new Icon(Icons.account_circle,
                  color: Colors.white,
                  size: 30.0,) ,),
                   new SizedBox(
                      width: 10.0,
                    ),
                  ],
                  title: new Text(
                    "Exit",
                    style: new TextStyle(
                      fontSize: 22.0,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Sans Serif",
                      fontStyle: FontStyle.normal,),
                  ),),
                drawer: new Drawer(
                  elevation: 10.0,
                  child: new Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    child: new ListView(
                    children: <Widget>[
                      new DrawerHeader(
                        child: new Container(
                          height: 150.0,
                          alignment: Alignment.center,
                          child: new Text(
                        "Parametres",
                        style: new TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                        )
                      ),
                      new ListTile(
                        title: new Text("Langues",
                        style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        )
                        ),
                        leading: new Icon(Icons.language,
                        color: Colors.grey,
                        size: 20.0,),
                        trailing: new Icon(Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 20.0,),
                        onTap: (){
          
                        },
                      ),
                       new ListTile(
                        title: new Text("Site Web",
                        style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        )
                        ),
                        leading: new Icon(Icons.language,
                        color: Colors.grey,
                        size: 20.0,),
                        trailing: new Icon(Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 20.0,),
                        onTap: (){
                          
                        },
                      ),
                       new ListTile(
                        title: new Text("Notifications",
                        style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        )
                        ),
                        leading: new Icon(Icons.notifications,
                        color: Colors.grey,
                        size: 20.0,),
                        trailing: new Icon(Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 20.0,),
                        onTap: (){
                          
                        },
                      ),
                       new ListTile(
                        title: new Text("Publicités",
                        style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        )
                        ),
                        leading: new Icon(Icons.pageview,
                        color: Colors.grey,
                        size: 20.0,),
                        trailing: new Icon(Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 20.0,),
                        onTap: (){
                          
                        },
                      ),
                       new ListTile(
                        title: new Text("Page d'aide",
                        style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        )
                        ),
                        leading: new Icon(Icons.pageview,
                        color: Colors.grey,
                        size: 20.0,),
                        trailing: new Icon(Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 20.0,),
                        onTap: (){
                          
                        },
                      ),
                       new ListTile(
                        title: new Text("Signaler un probleme",
                        style: new TextStyle(
                          color: Colors.grey,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal,
                        )
                        ),
                        leading: new Icon(Icons.report_problem,
                        color: Colors.grey,
                        size: 20.0,),
                        trailing: new Icon(Icons.keyboard_arrow_right,
                        color: Colors.grey,
                        size: 20.0,),
                        onTap: (){
                          
                        },
                      )
                    ],
                    ),
                  ),
                ),
               );
            }
          
            void goToAccount() {
               Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
               return new Account(auth: new Auth(),
               onSignedOut: onSignedOut,);
               }));
           }
}