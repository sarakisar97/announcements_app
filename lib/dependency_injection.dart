import 'package:announcements_app/cubit/announcement_cubit/announcement_cubit.dart';
import 'package:announcements_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:announcements_app/cubit/comment_cubit/comment_cubit.dart';
import 'package:announcements_app/network/services/announcements_service.dart';
import 'package:announcements_app/network/services/auth_service.dart';
import 'package:announcements_app/network/services/comments_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setup() async {
  await Firebase.initializeApp();
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);
  getIt.registerFactory(() => AuthService());
  getIt.registerFactory(() => AuthCubit(getIt<AuthService>()));
  getIt.registerFactory(() => AnnouncementsService());
  getIt.registerFactory(() => AnnouncementCubit(getIt<AnnouncementsService>()));
  getIt.registerFactory(() => CommentsService());
  getIt.registerFactory(() => CommentCubit(getIt<CommentsService>()));
}
