// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../views/auth/sign_up/sign_up.dart' as _i2;
import '../views/landing.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Landing.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Landing());
    },
    SignUp.name: (routeData) {
      final args =
          routeData.argsAs<SignUpArgs>(orElse: () => const SignUpArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.SignUp(key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(Landing.name, path: '/'),
        _i3.RouteConfig(SignUp.name, path: '/sign-up')
      ];
}

/// generated route for [_i1.Landing]
class Landing extends _i3.PageRouteInfo<void> {
  const Landing() : super(name, path: '/');

  static const String name = 'Landing';
}

/// generated route for [_i2.SignUp]
class SignUp extends _i3.PageRouteInfo<SignUpArgs> {
  SignUp({_i4.Key? key})
      : super(name, path: '/sign-up', args: SignUpArgs(key: key));

  static const String name = 'SignUp';
}

class SignUpArgs {
  const SignUpArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'SignUpArgs{key: $key}';
  }
}
