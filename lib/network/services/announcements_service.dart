import 'package:cloud_firestore/cloud_firestore.dart';

class AnnouncementsService{

  Future<void> postAnnouncement(Map<String, dynamic> body) async {
    final CollectionReference announcements = FirebaseFirestore.instance.collection('announcements');
    await announcements.add(body);
  }

  Future<void> updateAnnouncement(Map<String, dynamic> body, String id) async {
    final CollectionReference announcements = FirebaseFirestore.instance.collection('announcements');
    announcements.where('id', isEqualTo: id).get().then((value) {
      value.docs.first.reference.update(body);
    });
  }
}