import 'package:announcements_app/app_observer.dart';
import 'package:announcements_app/dependency_injection.dart';
import 'package:announcements_app/routes/app_route.gr.dart';
import 'package:announcements_app/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  BlocOverrides.runZoned(
        () => runApp(App()),
    blocObserver: AppObserver(),
  );
}

class App extends StatelessWidget {
  final _appRouter = AppRouter();
  App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConstants.appTitle,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
