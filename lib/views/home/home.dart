import 'package:announcements_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:announcements_app/network/models/announcement_model.dart';
import 'package:announcements_app/network/models/user_model.dart';
import 'package:announcements_app/routes/app_route.gr.dart';
import 'package:announcements_app/utils/app_constants.dart';
import 'package:announcements_app/views/components/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_ui/firestore_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.user}) : super(key: key);
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: const Text(AppConstants.appTitle),
        actions: [
          IconButton(onPressed: () => context.read<AuthCubit>().logout(), icon: const Icon(Icons.exit_to_app))
        ],
      ),
      body: FirestoreAnimatedList(
          query: FirebaseFirestore.instance.collection('announcements'),
          itemBuilder: (
              BuildContext context,
              DocumentSnapshot<Object?>? snapshot,
              Animation<double> animation,
              int index) {
            AnnouncementModel announcementModel = AnnouncementModel.fromJson(snapshot!.data());
            return Card(
              elevation: 3,
              child: ListTile(
                title: Text(announcementModel.content ?? ''),
                trailing: user.type == UserType.teacher.name ? IconButton(onPressed: () => context.pushRoute(AnnouncementCard(announcementModel: announcementModel)), icon: const Icon(Icons.edit)) : null,
                onTap: (){
                  context.pushRoute(Comments(announcementId: announcementModel.id!, user: user));
                },
              ),
            );
          }),
      floatingActionButton: user.type == UserType.teacher.name ? FloatingActionButton(onPressed: () => context.pushRoute(AnnouncementCard(userId: user.id)), child: const Icon(Icons.add)) : null,
    );
  }
}
