import 'package:exit/pages/home/home.dart';
import 'package:exit/pages/home/home_manager.dart';
import 'package:exit/services/auth.dart';
import 'package:exit/utilis/constants.dart';
import 'package:exit/utilis/textformatters.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'login_page.dart';

class Connexion extends StatefulWidget{
   Connexion({this.auth , this.onSignedIn});
   BaseAuth auth;
   VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() {
    return new _Connexion();
  }
}

class _Connexion extends State<Connexion>{
  @override
  Widget build(BuildContext context) {
    String connexion_title = "CONNEXION";
    String usernameAlert = "Le nom d'utilisateur doit contenir moins de 20 caracteres";
    String connexion_title_with_facebook = "CONNEXION AVEC FACEBOOK";
    String requiredField = "Champs Obligatoire";
    String name = "";
    String username , email , password;
    AuthStatus authStatus = AuthStatus.notsigned;

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

     void signedIn(){
    setState(() {
      authStatus = AuthStatus.signedIn;
    });
  }

  void goToInscription(){
                          Navigator.push(context,
                           PageRouteBuilder(
                             transitionDuration: Duration(milliseconds: 1500),
                             transitionsBuilder: (BuildContext context,
                             Animation<double> animation ,
                             Animation<double> secAnimation, 
                             Widget child){

                               animation = CurvedAnimation(parent: animation,curve: Curves.elasticInOut);
                               return ScaleTransition(
                                 alignment: Alignment.lerp(Alignment.bottomCenter, Alignment.center, 10.0),
                                 scale: animation,
                                 child: child ,);
                             },
                             pageBuilder: (BuildContext context,Animation<double> animation ,Animation<double> secAnimation){
                               return Inscription(auth: widget.auth,
                               onSignedIn: signedIn,);
                             }
                             )
                          );
                        }

                          Future<void> recoverInformations() async {
                       final GlobalKey<FormState> formKeyRecoverPassword = GlobalKey<FormState>();
                          return showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext buildcontext){
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                content: new SingleChildScrollView(
                                  child: new ListBody(
                                  children: <Widget>[
                                    new Text("Retrouvez votre mot de passe",
                                    style: new TextStyle(
                                      color:Colors.blueGrey,
                                      fontSize:15.0,

                                    ),),
                                new Container(
                                  child: new TextFormField(
                                 validator: (String value){
                                  if(value.length >= 21){
                                  return "...";
                               }
                                 else if(value.trim().isEmpty){
                                     return 'Champs Obligatoire';
                                 }
                            },      

                      controller: new TextEditingController(),
                       keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
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
                     padding: EdgeInsets.only(top:32),
                      )
                                  ],
                                  ),
                                ),
                                actions: <Widget>[
                                  new FlatButton(
                                    onPressed: (){
                                      Navigator.of(context).pop();
                                    }, 
                                    child: new Icon(Icons.close,
                                    color: kPrimaryColor,),
                                    ) ,
                                    new FlatButton(
                                    onPressed: (){
                                      if(formKeyRecoverPassword.currentState.validate()){
                            Scaffold.of(context).
                            showSnackBar(
                              SnackBar(
                                content:
                                new Text('Processing Data'),));
                          }
                          formKeyRecoverPassword.currentState.save();
                        }, 
                                    child: new Icon(Icons.check,
                                    color: kPrimaryColor,),
                                    )                                   
                                ],
                                );
                            }
                          );
                        }

      bool validateAndSave(){
              final form = formKey.currentState;
              if(form.validate()){
                     form.save();
                     return true;
                 }
              return false;
       } 

    showAlertDialog(BuildContext context){
      AlertDialog alert=AlertDialog(
        backgroundColor: Colors.white,
        content: new Row(
            children: [
               CircularProgressIndicator(
                  backgroundColor: kPrimaryColor,
                  value: 10.0,
               ),
                new SizedBox(width: 15.0),
               Container(
                 
               margin: EdgeInsets.only(left: 5),
               child:Text("Connexion..." )),
            ],),
      );
      showDialog(barrierDismissible: false,
        context:context,
        builder:(BuildContext context){
          return alert;
        },
      );
    }

    void validateAndSubmit() async{
    if(validateAndSave()){
      try {
      showAlertDialog(context);
      String userId = await widget.auth.signInWithEmailAndPassword(email, password);
      print('Signed in: ${userId}');
      widget.onSignedIn();
      Navigator.pop(context);
      } catch (e) {
        print(e.toString());
        Navigator.of(context).pop();
        scaffoldKey.currentState.showSnackBar(
                      new SnackBar(duration: new Duration(seconds: 6), 
                      content:
                      new Container(
                        height: 20.0,
                        child:new Row(
                        children: <Widget>[
                          new Icon(Icons.warning,
                          color: kPrimaryColor,
                          size: 20.0,),
                          new SizedBox(width: 2.0),
                            Text("Désolé Nous n'avons pas pu vous connecter , veuillez réessayer",
                                style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                )),
                        ],
                      ),
                      )
                      ));
      }
    }
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

    Widget _buildUsernameTextFormField(){
      return new Container(
                      child: new TextFormField(
                      onChanged: (String value){

                      },
                      onSaved: (value){
                        email = value;
                      },
                      inputFormatters: [new TextFormatter()],
                      validator: (String value){
                         if(value.trim().isEmpty){
                            return requiredField;
                          }
                      },
                      controller: new TextEditingController(),
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                      labelText: "NOM D'UTILISATEUR",
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
                    padding: EdgeInsets.only(left:30.0,right:30.0,top: 25.0),
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
                        labelText: "MOT DE PASSE",
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
                      child: new Text("CONNEXION",
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

    Widget _buildRecoverUserInfo(){
      return new Container(
                    alignment: Alignment(1.0, 0.0),
                    padding: EdgeInsets.only(top:15.0,right:20.0),
                    child: new GestureDetector(
                      onTap:recoverInformations,
                      child : new InkWell(
                      child: new Text("Mot de passe oublié ?",
                      style: new TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        fontFamily: "Montserrat",
                        decoration: TextDecoration.underline
                      )
                      )
                      ),
                    ),
                  );
                                       
    }

  Widget _buildButtonCreateNewAccount(){
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
                      onPressed: goToInscription,
                      child:
                           new Text("Creer un nouveau compte Exit",
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


    return Scaffold(
          backgroundColor: kPrimaryColor,
          key: scaffoldKey,
          body: new Form(
            key: formKey,
            child: new ListView(
               children: <Widget>[
              _buildIconExit(),
             new Container(
               color: Colors.white,
               height: MediaQuery.of(context).size.height - 175,
               child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new SizedBox(
                    height: 2.0,
                  ),
                  _buildUsernameTextFormField(),
                  new SizedBox(
                    height: 4.0,
                  ),
                  _buildPasswordTextFormField(),
                   new SizedBox(
                    height: 5.0,
                  ),
                  _buildRecoverUserInfo(),
                  new SizedBox(
                    height: 15.0,
                  ),
                  _buildButtonValidation(),
                  new SizedBox(
                    height: 15.0,
                  ),
                  _buildButtonCreateNewAccount(),
                  new SizedBox(
                    height: 15.0,
                  ),
                  new Row(
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
                  ],)
                    ],
                         ),
             )
            ],
          )
            )
                          );
                        }
                     
                        
                        void goToHome(){
       Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
               return new HomePage();
           }));
  }
}
