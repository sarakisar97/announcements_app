import 'dart:io';
import 'package:announcements_app/utils/utils.dart';
import 'package:announcements_app/views/components/components.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  File? _image;
  String? _username;
  String? _password;
  String? _confirmPassword;
  UserType? _userType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: Text('Sign Up'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DefaultTextFormField(
                  decoration: const InputDecoration(
                    labelText: 'User name',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: qValidator([
                    const IsRequired(),
                    const MinLength(5)
                  ]),
                  onSaved: (value) => _username = value,
                ),
                const SizedBox(height: 16.0),
                PasswordFormTextField(
                  labelText: 'Password',
                  textInputAction: TextInputAction.next,
                  onSaved: (value) => _password = value,
                  validator: qValidator([
                    const IsRequired(),
                    const MinLength(8),
                    const MaxLength(18),
                    RegExpRule(AppConstants.passwordRegExp),
                  ]),
                ),
                const SizedBox(height: 16.0),
                PasswordFormTextField(
                  labelText: 'Confirm password',
                  textInputAction: TextInputAction.done,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'required';
                    }
                    else if(value != _password){
                      return 'Passwords don\'t match';
                    }
                  },
                  onSaved: (value) => _confirmPassword = value,
                ),
                const SizedBox(height: 16.0),
                DefaultDropDownButtonFormField<UserType>(
                  decoration: const InputDecoration(
                    labelText: 'Select',
                  ),
                  value: UserType.teacher,
                  items: UserType.values.map((e) => DropdownMenuItem<UserType>(value: e, child: Text(e.name))).toList(),
                  onChanged: (_){},
                  onSaved: (value) => _userType = value,
                ),
                const SizedBox(height: 30.0),
                SubmitButton(onPressed: (){
                  if(FocusScope.of(context).hasFocus){
                    FocusScope.of(context).unfocus();
                  }
                  _formKey.currentState!.save();
                  if(_formKey.currentState!.validate()){
                    // context.read<AddAnAdminCubit>().addAnAdmin(
                    //     _phoneNumber,
                    //     _username!,
                    //     _firstname,
                    //     _lastname,
                    //     _email,
                    //     _birthYear!,
                    //     _city!,
                    //     _password!,
                    //     _confirmPassword!,
                    //     _claims);
                  }
                }, child: const Text('SIGN UP')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
