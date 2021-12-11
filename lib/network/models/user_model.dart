import 'dart:io';

import 'package:uuid/uuid.dart';

class UserModel {
  UserModel({
      this.id, 
      this.image, 
      this.username, 
      this.password, 
      this.type,
      this.imageFile
  });

  String? id;
  String? image;
  String? username;
  String? password;
  String? type;
  File? imageFile;

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
    username = json['username'];
    password = json['password'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id ?? const Uuid().v1();
    map['image'] = image;
    map['username'] = username;
    map['password'] = password;
    map['type'] = type;
    return map;
  }

}