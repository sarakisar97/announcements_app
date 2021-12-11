abstract class CommentState{}

class CommentInitial extends CommentState{}
class CommentLoadInProgress extends CommentState {}
class CommentLoadSuccess extends CommentState {}
class CommentLoadFailure extends CommentState {
  String message;
  CommentLoadFailure(this.message);
}