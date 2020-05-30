import 'package:exit/pages/authenfication/signin_page.dart';
import 'package:exit/pages/home/home.dart';
import 'package:exit/pages/home/home_manager.dart';
import 'package:exit/utilis/constants.dart';
import 'package:exit/utilis/textformatters.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:exit/services/auth.dart';
import 'package:toast/toast.dart';

class Inscription extends StatefulWidget{
  Inscription({this.auth, this.onSignedIn});
  BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() {
    return new _Inscription();
  }
}
class _Inscription extends State<Inscription>{
    String username , email , password;
    bool isCertified = false;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

     bool validateAndSave(){
     final form = formKey.currentState;
     if(form.validate()){
     form.save();
     return true;
     }
       return false;
  }

 
  void validateAndSubmit() async{
    if(validateAndSave()){
      try {
      String userId = await widget.auth.createUser(username, email , password , isCertified);
      print('Signed in: ${userId}');
      widget.onSignedIn();
      } catch (e) {
        print("Error : $e");
        Toast.show("Erreur : $e", context ,
        duration: Toast.LENGTH_LONG ,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    
    AuthStatus authStatus = AuthStatus.notsigned;

    void onSignedOut(){
    setState(() {
      authStatus = AuthStatus.notsigned;
    });
  }

        void signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

    void goToConnexion(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new Connexion(auth: widget.auth,
      onSignedIn: signedIn,);
    }));
  }

        Widget _buildIconExit(){
      return new Container(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        color: kPrimaryColor,
        child: new Image.asset("assets/exit_birds.png",
        width: MediaQuery.of(context).size.width,
        height: 150.0
        ),
      );
    }

    Widget _buildEmailTextFormField(){
      return new Container(
       child: new TextFormField(
                      onChanged: (String value){

                      },
                      onSaved: (value){
                        email = value;
                      },
                      validator: (String value){
                        if(value.trim().isEmpty){
                          return "Champs Obligatoire";
                        }
                      },
                      controller: new TextEditingController(),
                      keyboardType: TextInputType.emailAddress,
                      decoration:  new InputDecoration(
                        labelText: "Email ou numéro de téléphone",
                        labelStyle: new TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"
                        ),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: kPrimaryColor)
                        ),
                      ),
                    ),
                      padding: EdgeInsets.only(left:30.0,right:30.0, top: 5.0)
      );
    }

    Widget _buildUsernameTextFormField(){
      return new Container(
                      child: new TextFormField(
                      onChanged: (String value){
            
                      },
                      onSaved: (value){
                        username = value;
                      },
                      inputFormatters: [new TextFormatter()],
                      validator: (String value){
                          if(value.length >= 21){
                            return "";
                          }
                         if(value.trim().isEmpty){
                            return "";
                          }
                      },
                      controller: new TextEditingController(),
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                      labelText: "Nom d'utilisateur",
                      labelStyle: new TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"
                        ),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: kPrimaryColor)
                        ),
                      ),
                    ),
                    padding: EdgeInsets.only(left:30.0,right:30.0,top: 15.0),
                  );
    }

    Widget _buildPasswordTextFormField(){
      return  new Container(
                    child: new TextFormField(
                      onChanged: (String value){

                      },
                        onSaved: (value){
                        password = value;
                      },
                      validator: (String value){
                        if(value.trim().isEmpty){
                          return "Champs Obligatoire";
                        }
                        else if (value.length < 8){
                          return 'Le mot de passe doit contenir au moins 8 caracteres';
                        }
                      },
                      obscureText: true,
                      controller: new TextEditingController(),
                      keyboardType: TextInputType.text,
                      decoration:  new InputDecoration(
                        labelText: "Mot de passe",
                        labelStyle: new TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Montserrat"
                        ),
                        focusedBorder: new UnderlineInputBorder(
                          borderSide: new BorderSide(color: kPrimaryColor)
                        ),
                      ),
                    ),
                    padding: EdgeInsets.only(left:30.0,right:30.0, top: 15.0),
                  );
    }

    Widget _buildButtonValidation(){
      return  new Container(
                    width: double.infinity,
                    child: new ButtonTheme(
                      minWidth: 200.0,
                      height: 50.0,
                      child: new RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          side: BorderSide(color: kPrimaryColor)
                      ),
                      onPressed: validateAndSubmit,
                      child: new Text("INSCRIPTION",
                        style: new TextStyle(
                          color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 20.0,
                           fontFamily: "Monserrat",
                           fontStyle: FontStyle.normal,
                        ),),
                      color: kPrimaryColor,
                    ),
                  ),
                    padding: EdgeInsets.only(left: 32,right: 32,top:15),
                  );
    }

  Widget _buildButtonLogIn(){
      return new Container(
                    width: double.infinity,
                    child: new ButtonTheme(
                      minWidth: 200.0,
                      height: 50.0,
                      child: new RaisedButton(
                      color: Colors.blue,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)
                      ),
                      onPressed: goToConnexion,
                      child:
                           new Text("J'ai déja un compte Exit",
                           style: new TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.bold,
                           fontSize: 17.0,
                           fontFamily: "Monserrat",
                           fontStyle: FontStyle.normal,
                        ),),
                      ),
                    ),
                    padding: EdgeInsets.only(left: 32,right: 32,top:0.0),
                  );
    }

    Widget _buildUsingInformations(){
      return  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Text("Consulter les conditions d'utilisations",
                      style: new TextStyle(
                        fontFamily: "Montserrat",
                        color: Colors.grey),),
                         new SizedBox(
                        width: 3.0,
                        ),
                        new InkWell(
                          onTap: (){
                          },
                        child: new Text("Ici",
                        style: new TextStyle(
                        fontFamily: "Montserrat",
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline
                        ),
                        ),
                        )
                  ],);
    }

    Widget _buildSpaceBetweenWidget(double value){
      return new SizedBox(
           height: value,
          );
    }


    if(authStatus == AuthStatus.signedIn){
      return new Scaffold(
        body: new Home(
          auth: widget.auth,
          onSignedOut: onSignedOut,
          ),
      );
    }
    else{
      return new Scaffold(
        backgroundColor: kPrimaryColor,
          body: new Center(
            child: new ListView(
               children: <Widget>[
              _buildIconExit(),
             new Container(
               color: Colors.white,
               height: MediaQuery.of(context).size.height - 175,
               child: new Form(
                 key: formKey,
                 child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildSpaceBetweenWidget(0.0),
                  _buildUsernameTextFormField(),
                  _buildSpaceBetweenWidget(0.0),
                  _buildEmailTextFormField(),
                  _buildSpaceBetweenWidget(0.0),
                  _buildPasswordTextFormField(),
                  _buildSpaceBetweenWidget(5.0),
                  _buildButtonValidation(),
                  _buildSpaceBetweenWidget(15.0),
                  _buildButtonLogIn(),
                  _buildSpaceBetweenWidget(15.0),
                  _buildUsingInformations(),
                    ],
                         ),)
             )
            ],
          )
            )
    );
    }
    
  }

  void goToHome(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new HomePage();
    }));
  }
}