import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String username;
  final String id;
  final String email;
  final String profileName;
  final String profilePhoto;
  final String bio;
  final String linkInBio;
  final bool isCertified;

  User( {this.username , this.id , this.email , this.isCertified , this.profileName, this.profilePhoto, this.bio, this.linkInBio,});

  factory User.fromDocument(DocumentSnapshot doc){
    return User(
      username: doc["username"],
      id: doc["id"],
      email: doc["email"],
      isCertified: doc["isCertified"],
      profileName: doc["profileName"],
      profilePhoto: doc["urlPhoto"],
      bio: doc["bio"],
      linkInBio: doc["linkInBio"]
      );
  }
  
}