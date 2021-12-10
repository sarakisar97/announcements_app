import 'package:announcements_app/utils/app_constants.dart';
import 'package:announcements_app/views/components/components.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(
        title: Text(AppConstants.appTitle),
        // actions: [
        //   IconButton(onPressed: () => context.pushRoute(AddAnAdmin()), icon: const Icon(Icons.person_add_alt)),
        //   IconButton(onPressed: () => context.read<AuthCubit>().logout(), icon: const Icon(Icons.exit_to_app))
        // ],
      ),
      body: Center(
        child: Text('Test')
      ),
    );
  }
}
