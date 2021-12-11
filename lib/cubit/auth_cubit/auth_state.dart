import 'package:announcements_app/network/models/user_model.dart';

abstract class AuthState{}

class AuthUnKnown extends AuthState{}
class AuthLoadInProgress extends AuthState {}
class AuthLoadSuccess extends AuthState {
  UserModel userModel;
  AuthLoadSuccess(this.userModel);
}
class AuthLoadFailure extends AuthState {
  String message;
  AuthLoadFailure(this.message);
}