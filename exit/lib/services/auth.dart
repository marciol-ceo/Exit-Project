import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exit/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';


abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email,String password);
  Future<String> createUserWithEmailAndPassword(String email,String password);
  Future<String> currentUser();
  Future<void> signoutOut();
  Future<String> createUser(String username, String mail, String password, bool isCertified);
}

class Auth implements BaseAuth{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final usersReference = Firestore.instance.collection("users");
  final DateTime timestamp = DateTime.now();
  User _user;
  FirebaseUser user;

  Future<String> signInWithEmailAndPassword(String email,String password) async{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email.toString().trim() , password: password);
       user = result.user;
       return user.uid;
  }

   Future<String> createUserWithEmailAndPassword(String email,String password) async{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email.toString().trim() , password: password);
      user = result.user;
      return user.uid;
  }

  Future<String> currentUser() async{
    user = await _firebaseAuth.currentUser();
    return user != null ? user.uid : null;
  }

  Future<void> signoutOut() async{
    return _firebaseAuth.signOut();
  }

Future<String> createUser(String username, String mail, String password, bool isCertified) async{
AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: mail, password: password);
await saveUserToFirestore(username,mail,isCertified);
 user = result.user;
if(user.uid != null){
   Firestore.instance.collection("user").add(
  {
   'username': username,
    'password': password,
    'certified': isCertified,
  }).then((value){
    print(value.documentID);
  });
}
  return user.uid;
 }

  saveUserToFirestore(String username, String mail,bool isCertified) async {
    user = await _firebaseAuth.currentUser();
    DocumentSnapshot documentSnapshot = await usersReference.document(user.uid).get();

    if(documentSnapshot.exists){
      usersReference.document(user.uid).setData({
      "id": user.uid,
      "username": username,
      "isCertified": isCertified,
      "profilePhoto": "",
      "bio": "",
      "linkInBio": "",
      "email": mail,
      "timestamp": timestamp,
    });
    documentSnapshot = await usersReference.document(user.uid).get();
        }
   _user = User.fromDocument(documentSnapshot);
   }
}