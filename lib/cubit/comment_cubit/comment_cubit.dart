import 'dart:io';

import 'package:announcements_app/cubit/comment_cubit/comment_state.dart';
import 'package:announcements_app/network/models/comment_model.dart';
import 'package:announcements_app/network/services/comments_service.dart';
import 'package:announcements_app/utils/utils.dart';
import 'package:bloc/bloc.dart';

class CommentCubit extends Cubit<CommentState>{
  CommentCubit(this._commentsService) : super(CommentInitial());

  final CommentsService _commentsService;

  void postComment(String userId, String content, String announcementId) async{
    try{
      emit(CommentLoadInProgress());
      CommentModel newComment = CommentModel(userId: userId, content: content, announcementId: announcementId);
      _commentsService.postComment(newComment.toJson()).then((value) {
        emit(CommentLoadSuccess());
      }).onError((error, stackTrace) {
        emit(CommentLoadFailure(error.toString()));
      });
    } on SocketException{
      emit(CommentLoadFailure(AppConstants.checkInternet));
    }
  }

}