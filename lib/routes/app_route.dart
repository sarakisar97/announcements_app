import 'package:announcements_app/views/auth/sign_up/sign_up.dart';
import 'package:announcements_app/views/landing.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Landing, initial: true),
    AutoRoute(page: SignUp),
  ],
)
class $AppRouter {}