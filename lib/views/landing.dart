import 'package:announcements_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:announcements_app/cubit/auth_cubit/auth_state.dart';
import 'package:announcements_app/views/auth/login/login.dart';
import 'package:announcements_app/views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Landing extends StatelessWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (BuildContext context, AuthState? state) {
          if(state is AuthLoadFailure){
            showDialog(context: context, builder: (_) =>
                AlertDialog(content: Text((state.message))));
          }
        },
        builder: (BuildContext context, state) {
          if(state is AuthLoadSuccess){
            return const Home();
          }
          if(state is AuthLoadInProgress){
            return const Scaffold(body: Center(child: CircularProgressIndicator()));
          }
          return Login();
        },
      ),
    );
  }
}
