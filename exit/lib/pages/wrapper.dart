import 'package:exit/services/auth.dart';
import 'package:exit/utilis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'authenfication/signin_page.dart';
import 'home/home.dart';
import 'home/home_manager.dart';

class Wrapper extends StatefulWidget{
    Wrapper({this.auth});
    BaseAuth auth;
  @override
  State<StatefulWidget> createState() {
    return new _Wrapper();
  }
}

class _Wrapper extends State<Wrapper>{
  AuthStatus authStatus = AuthStatus.notsigned;


  @override
  void initState()  { 
  super.initState();
   widget.auth.currentUser().then((userId){
     setState(() {
      authStatus = userId == null ? AuthStatus.notsigned : AuthStatus.signedIn;
     });
   }).catchError((onError){
     authStatus = AuthStatus.notsigned;
   });
  }

  void signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

    void onSignedOut(){
    setState(() {
      authStatus = AuthStatus.notsigned;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(authStatus == AuthStatus.notsigned){
      return new Scaffold(
        body: new Connexion(
          auth: widget.auth,
          onSignedIn: signedIn,
          ),
      );
    }
    else if(authStatus == AuthStatus.signedIn){
      return new Scaffold(
        body: new Home(auth: widget.auth,
        onSignedOut: onSignedOut,),
      );
    }
    
  }

}
