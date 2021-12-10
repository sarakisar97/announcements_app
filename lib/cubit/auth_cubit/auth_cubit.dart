import 'dart:io';
import 'package:announcements_app/cubit/auth_cubit/auth_state.dart';
import 'package:announcements_app/dependency_injection.dart';
import 'package:announcements_app/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthUnKnown()){
    // String? token = getIt<SharedPreferences>().getString(AppConstants.tokenHeader);
    // if(token != null){
    //   emit(AuthLoadSuccess(Account(token: token)));
    // }
  }

  void login(String username, String password) async{
    // emit(AuthLoadInProgress());
    // Account newAccount = Account(username: username, password: password);
    // try{
    //   Response<Result<AccountApiModel>> response = await getIt<AccountsService>().login(newAccount.loginToJson());
    //   if(response.isSuccessful){
    //     Result<AccountApiModel>? result = response.body;
    //     if(result is Success){
    //       Account account = (result as Success).value.account;
    //       getIt<SharedPreferences>().setString(ADConstants.tokenHeader, account.token!);
    //       emit(AuthLoadSuccess(account));
    //     }
    //     else{
    //       emit(AuthLoadFailure((result as Error).exception.toString()));
    //     }
    //   }
    // } on SocketException{
    //   emit(AuthLoadFailure(ADLocale.getTranslatedWithoutContext('network_exception_message')));
    // }
  }

  void logout(){
    // getIt<SharedPreferences>().remove(ADConstants.tokenHeader);
    emit(AuthUnKnown());
  }
}