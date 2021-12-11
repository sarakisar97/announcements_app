import 'dart:convert';
import 'dart:io';
import 'package:announcements_app/cubit/auth_cubit/auth_state.dart';
import 'package:announcements_app/dependency_injection.dart';
import 'package:announcements_app/network/models/user_model.dart';
import 'package:announcements_app/network/services/auth_service.dart';
import 'package:announcements_app/utils/utils.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authService) : super(AuthUnKnown()){
    String? userObject = getIt<SharedPreferences>().getString(AppConstants.userObject);
    if(userObject != null){
      emit(AuthLoadSuccess(UserModel.fromJson(json.decode(userObject))));
    }
  }

  final AuthService _authService;

  void login(String username, String password) async{
    try{
      emit(AuthLoadInProgress());
      UserModel newUser = UserModel(username: username, password: password);
      _authService.login(newUser).then((value) {
        UserModel userModel = UserModel.fromJson(value.docs.first.data());
        emit(AuthLoadSuccess(userModel));
        getIt<SharedPreferences>().setString(AppConstants.userObject, json.encode(value.docs.first.data()));
      }).onError((error, stackTrace) {
        emit(AuthLoadFailure(error.toString()));
      });
    } on SocketException{
      emit(AuthLoadFailure(AppConstants.checkInternet));
    }
  }

  Future<void> signUp(File? image, String username, String password, UserType type) async {
    try{
      emit(AuthLoadInProgress());
      UserModel newUser = UserModel(imageFile: image, username: username, password: password, type: type.name);
      _authService.signUp(newUser.toJson(), image).then((value) {
        UserModel userModel = UserModel.fromJson(value.data());
        emit(AuthLoadSuccess(userModel));
        getIt<SharedPreferences>().setString(AppConstants.userObject, json.encode(value.data()));
      }).onError((error, stackTrace) {
        emit(AuthLoadFailure(error.toString()));
      });
    } on SocketException{
      emit(AuthLoadFailure(AppConstants.checkInternet));
    }
  }

  void logout(){
    getIt<SharedPreferences>().remove(AppConstants.userObject);
    emit(AuthUnKnown());
  }
}