abstract class AnnouncementState{}

class AnnouncementInitial extends AnnouncementState{}
class AnnouncementLoadInProgress extends AnnouncementState {}
class AnnouncementLoadSuccess extends AnnouncementState {}
class AnnouncementLoadFailure extends AnnouncementState {
  String message;
  AnnouncementLoadFailure(this.message);
}