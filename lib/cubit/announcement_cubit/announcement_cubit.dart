import 'dart:io';
import 'package:announcements_app/cubit/announcement_cubit/announcement_state.dart';
import 'package:announcements_app/network/models/announcement_model.dart';
import 'package:announcements_app/network/services/announcements_service.dart';
import 'package:announcements_app/utils/utils.dart';
import 'package:bloc/bloc.dart';

class AnnouncementCubit extends Cubit<AnnouncementState> {
  AnnouncementCubit(this._announcementsService) : super(AnnouncementInitial());

  final AnnouncementsService _announcementsService;

  void postAnnouncement(String userId, String content) async{
    try{
      emit(AnnouncementLoadInProgress());
      AnnouncementModel newAnnouncement = AnnouncementModel(userId: userId, content: content);
      _announcementsService.postAnnouncement(newAnnouncement.toJson()).then((value) {
        emit(AnnouncementLoadSuccess());
      }).onError((error, stackTrace) {
        emit(AnnouncementLoadFailure(error.toString()));
      });
    } on SocketException{
      emit(AnnouncementLoadFailure(AppConstants.checkInternet));
    }
  }

  Future<void> updateAnnouncement(String id, String content) async {
    try{
      emit(AnnouncementLoadInProgress());
      AnnouncementModel newAnnouncement = AnnouncementModel(content: content);
      _announcementsService.updateAnnouncement(newAnnouncement.toJson(), id).then((value) {
        emit(AnnouncementLoadSuccess());
      }).onError((error, stackTrace) {
        emit(AnnouncementLoadFailure(error.toString()));
      });
    } on SocketException{
      emit(AnnouncementLoadFailure(AppConstants.checkInternet));
    }
  }
}