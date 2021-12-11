import 'package:announcements_app/views/announcements/announcement_card.dart';
import 'package:announcements_app/views/auth/login/login.dart';
import 'package:announcements_app/views/auth/sign_up/sign_up.dart';
import 'package:announcements_app/views/comments/comments.dart';
import 'package:announcements_app/views/landing.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Landing, initial: true),
    AutoRoute(page: Login),
    AutoRoute(page: SignUp),
    AutoRoute(page: AnnouncementCard),
    AutoRoute(page: Comments),
  ],
)
class $AppRouter {}