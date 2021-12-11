import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsService{
  Future<void> postComment(Map<String, dynamic> body) async {
    final CollectionReference comments = FirebaseFirestore.instance.collection('comments');
    await comments.add(body);
  }
}