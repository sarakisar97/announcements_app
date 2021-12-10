import 'package:announcements_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:announcements_app/routes/app_route.gr.dart';
import 'package:announcements_app/views/components/components.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  String? _username;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DefaultTextFormField(
                decoration: const InputDecoration(
                  labelText: 'User name',
                ),
                textInputAction: TextInputAction.next,
                validator: qValidator([
                  const IsRequired(),
                ]),
                onSaved: (value) => _username = value,
              ),
              const SizedBox(height: 16.0),
              PasswordFormTextField(
                labelText: 'Password',
                textInputAction: TextInputAction.done,
                validator: qValidator([
                  const IsRequired(),
                ]),
                onSaved: (value) => _password = value,
              ),
              const SizedBox(height: 50.0),
              SubmitButton(onPressed: (){
                if(FocusScope.of(context).hasFocus){
                  FocusScope.of(context).unfocus();
                }
                _formKey.currentState!.save();
                if(_formKey.currentState!.validate()){
                  context.read<AuthCubit>().login(_username!, _password!);
                }
              }, child: const Text('LOGIN')),
              const SizedBox(height: 50.0),
              TextButton(onPressed: () => context.pushRoute(SignUp()), child: const Text('Create a new account'))
            ],
          ),
        ),
      ),
    );
  }
}
