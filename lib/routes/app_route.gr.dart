// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../network/models/announcement_model.dart' as _i8;
import '../network/models/user_model.dart' as _i9;
import '../views/announcements/announcement_card.dart' as _i4;
import '../views/auth/login/login.dart' as _i2;
import '../views/auth/sign_up/sign_up.dart' as _i3;
import '../views/comments/comments.dart' as _i5;
import '../views/landing.dart' as _i1;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Landing.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Landing());
    },
    Login.name: (routeData) {
      final args = routeData.argsAs<LoginArgs>(orElse: () => const LoginArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.Login(key: args.key));
    },
    SignUp.name: (routeData) {
      final args =
          routeData.argsAs<SignUpArgs>(orElse: () => const SignUpArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.SignUp(key: args.key));
    },
    AnnouncementCard.name: (routeData) {
      final args = routeData.argsAs<AnnouncementCardArgs>(
          orElse: () => const AnnouncementCardArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.AnnouncementCard(
              key: args.key,
              announcementModel: args.announcementModel,
              userId: args.userId));
    },
    Comments.name: (routeData) {
      final args = routeData.argsAs<CommentsArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.Comments(
              key: args.key,
              announcementId: args.announcementId,
              user: args.user));
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(Landing.name, path: '/'),
        _i6.RouteConfig(Login.name, path: '/Login'),
        _i6.RouteConfig(SignUp.name, path: '/sign-up'),
        _i6.RouteConfig(AnnouncementCard.name, path: '/announcement-card'),
        _i6.RouteConfig(Comments.name, path: '/Comments')
      ];
}

/// generated route for [_i1.Landing]
class Landing extends _i6.PageRouteInfo<void> {
  const Landing() : super(name, path: '/');

  static const String name = 'Landing';
}

/// generated route for [_i2.Login]
class Login extends _i6.PageRouteInfo<LoginArgs> {
  Login({_i7.Key? key})
      : super(name, path: '/Login', args: LoginArgs(key: key));

  static const String name = 'Login';
}

class LoginArgs {
  const LoginArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'LoginArgs{key: $key}';
  }
}

/// generated route for [_i3.SignUp]
class SignUp extends _i6.PageRouteInfo<SignUpArgs> {
  SignUp({_i7.Key? key})
      : super(name, path: '/sign-up', args: SignUpArgs(key: key));

  static const String name = 'SignUp';
}

class SignUpArgs {
  const SignUpArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'SignUpArgs{key: $key}';
  }
}

/// generated route for [_i4.AnnouncementCard]
class AnnouncementCard extends _i6.PageRouteInfo<AnnouncementCardArgs> {
  AnnouncementCard(
      {_i7.Key? key, _i8.AnnouncementModel? announcementModel, String? userId})
      : super(name,
            path: '/announcement-card',
            args: AnnouncementCardArgs(
                key: key,
                announcementModel: announcementModel,
                userId: userId));

  static const String name = 'AnnouncementCard';
}

class AnnouncementCardArgs {
  const AnnouncementCardArgs({this.key, this.announcementModel, this.userId});

  final _i7.Key? key;

  final _i8.AnnouncementModel? announcementModel;

  final String? userId;

  @override
  String toString() {
    return 'AnnouncementCardArgs{key: $key, announcementModel: $announcementModel, userId: $userId}';
  }
}

/// generated route for [_i5.Comments]
class Comments extends _i6.PageRouteInfo<CommentsArgs> {
  Comments(
      {_i7.Key? key,
      required String announcementId,
      required _i9.UserModel user})
      : super(name,
            path: '/Comments',
            args: CommentsArgs(
                key: key, announcementId: announcementId, user: user));

  static const String name = 'Comments';
}

class CommentsArgs {
  const CommentsArgs(
      {this.key, required this.announcementId, required this.user});

  final _i7.Key? key;

  final String announcementId;

  final _i9.UserModel user;

  @override
  String toString() {
    return 'CommentsArgs{key: $key, announcementId: $announcementId, user: $user}';
  }
}
