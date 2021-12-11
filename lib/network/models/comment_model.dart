import 'package:uuid/uuid.dart';

class CommentModel{
  String? id;
  String? content;
  String? userId;
  String? announcementId;

  CommentModel({this.userId, this.content, this.announcementId});

  CommentModel.fromJson(dynamic json) {
    id = json['id'];
    content = json['content'];
    userId = json['user_id'];
    announcementId = json['announcement_id'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id ?? const Uuid().v1();
    map['content'] = content;
    map['user_id'] = userId;
    map['announcement_id'] = announcementId;
    return map;
  }
}