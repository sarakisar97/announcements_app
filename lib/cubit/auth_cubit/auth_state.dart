abstract class AuthState{}

class AuthUnKnown extends AuthState{}
class AuthLoadInProgress extends AuthState {}
class AuthLoadSuccess extends AuthState {
  // Account account;
  // AuthLoadSuccess(this.account);
}
class AuthLoadFailure extends AuthState {
  String message;
  AuthLoadFailure(this.message);
}