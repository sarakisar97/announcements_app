import 'package:uuid/uuid.dart';

class AnnouncementModel{
  String? id;
  String? content;
  String? userId;

  AnnouncementModel({this.userId, this.content});

  AnnouncementModel.fromJson(dynamic json) {
    id = json['id'];
    content = json['content'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id ?? const Uuid().v1();
    map['content'] = content;
    map['user_id'] = userId;
    return map;
  }
}