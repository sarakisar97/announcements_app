import 'package:announcements_app/cubit/comment_cubit/comment_cubit.dart';
import 'package:announcements_app/cubit/comment_cubit/comment_state.dart';
import 'package:announcements_app/dependency_injection.dart';
import 'package:announcements_app/network/models/comment_model.dart';
import 'package:announcements_app/network/models/user_model.dart';
import 'package:announcements_app/utils/utils.dart';
import 'package:announcements_app/views/components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/animated_firestore_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';

class Comments extends StatelessWidget {
  Comments({Key? key, required this.announcementId, required this.user}) : super(key: key);
  final String announcementId;
  final UserModel user;
  final _formKey = GlobalKey<FormState>();
  String? _content;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CommentCubit>(),
      child: Scaffold(
        appBar: const DefaultAppBar(
          title: Text('Comments'),
        ),
        body: BlocConsumer<CommentCubit, CommentState>(
          listener: (BuildContext context, state) {
            if(state is CommentLoadFailure){
              showDialog(context: context, builder: (_) =>
                  AlertDialog(content: Text((state.message))));
            }
          },
          builder: (BuildContext context, Object? state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if(state is CommentLoadInProgress) const LinearProgressIndicator(),
                Expanded(
                  child: FirestoreAnimatedList(
                    query: FirebaseFirestore.instance.collection('comments').where('announcement_id', isEqualTo: announcementId),
                    itemBuilder: (
                        BuildContext context,
                        DocumentSnapshot<Object?>? snapshot,
                        Animation<double> animation, int index) {
                      CommentModel commentModel = CommentModel.fromJson(snapshot!.data());
                      return ListTile(
                        title: Text(commentModel.content ?? ''),
                      );
                    },),
                ),
                if(user.type == UserType.student.name) Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: DefaultTextFormField(
                            decoration: const InputDecoration(
                                hintText: 'Type a comment....'
                            ),
                            textInputAction: TextInputAction.done,
                            validator: qValidator([const IsRequired()]),
                            onSaved: (value) => _content = value,
                          ),
                        ),
                        Expanded(child: IconButton(
                            onPressed: (){
                              if(FocusScope.of(context).hasFocus){
                                FocusScope.of(context).unfocus();
                              }
                              if(_formKey.currentState!.validate()){
                                _formKey.currentState!.save();
                                context.read<CommentCubit>().postComment(user.id!, _content!, announcementId);
                              }
                            },
                            icon: const Icon(Icons.send, color: AppColors.primary)))
                      ],
                    ),
                  ),
                )
              ],
            );
          },),
      ),
    );
  }
}
