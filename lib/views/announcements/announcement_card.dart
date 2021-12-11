import 'package:announcements_app/cubit/announcement_cubit/announcement_cubit.dart';
import 'package:announcements_app/cubit/announcement_cubit/announcement_state.dart';
import 'package:announcements_app/dependency_injection.dart';
import 'package:announcements_app/network/models/announcement_model.dart';
import 'package:announcements_app/views/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:auto_route/auto_route.dart';

class AnnouncementCard extends StatelessWidget {
  AnnouncementCard({Key? key, this.announcementModel, this.userId}) : super(key: key);
  final AnnouncementModel? announcementModel;
  final String? userId;
  final _formKey = GlobalKey<FormState>();
  String? _content;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AnnouncementCubit>(),
      child: Scaffold(
        appBar: const DefaultAppBar(
          title: Text('Announcement Card'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<AnnouncementCubit, AnnouncementState>(
              listener: (BuildContext context, state) {
                if(state is AnnouncementLoadFailure){
                  showDialog(context: context, builder: (_) =>
                      AlertDialog(content: Text((state.message))));
                }
                if(state is AnnouncementLoadSuccess){
                  context.popRoute();
                }
              },
              builder: (BuildContext context, Object? state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DefaultTextFormField(
                      initialValue: announcementModel?.content,
                      decoration: const InputDecoration(
                          labelText: 'Content',
                          hintText: 'Type here....'
                      ),
                      maxLines: 6,
                      validator: qValidator([const IsRequired()]),
                      onSaved: (value) => _content = value,
                    ),
                    state is AnnouncementLoadInProgress ? const CircularProgressIndicator() : SubmitButton(onPressed: (){
                      if(FocusScope.of(context).hasFocus){
                        FocusScope.of(context).unfocus();
                      }
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        if(announcementModel == null){
                          context.read<AnnouncementCubit>().postAnnouncement(userId!, _content!);
                        }
                        else{
                          context.read<AnnouncementCubit>().updateAnnouncement(announcementModel!.id!, _content!);
                        }
                      }
                    }, child: const Text('POST')),
                  ],
                );
              },),
          ),
        ),
      ),
    );
  }
}
