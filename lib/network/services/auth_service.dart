import 'dart:io';

import 'package:announcements_app/network/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AuthService{

  Future<QuerySnapshot<Object?>> login(UserModel user) async {
    final CollectionReference users = FirebaseFirestore.instance.collection('users');
    final documentReference = users.where('username', isEqualTo: user.username).where('password', isEqualTo: user.password);
    return documentReference.get();
  }

  Future<DocumentSnapshot<Object?>> signUp(Map<String, dynamic> body, File? image) async {
    final CollectionReference users = FirebaseFirestore.instance.collection('users');
    if(image != null){
      TaskSnapshot uploadTask = await FirebaseStorage.instance.ref().child('users/${Uri.file(image.path).pathSegments.last}').putFile(image);
      String imageUrl = await uploadTask.ref.getDownloadURL();
      body['image'] = imageUrl;
    }
    final documentReference = await users.add(body);
    return documentReference.get();
  }
}