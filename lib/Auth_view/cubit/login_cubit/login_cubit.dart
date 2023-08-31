import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intern_auth/Auth_view/models/user_model.dart';
import 'package:intern_auth/services/remote/dio_helper.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  final formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  UserModel userModel = UserModel();

  UserModel Person = UserModel();

  bool isLoading = false;

  Future<void> LoginByApi(
      {required String username, required String pass}) async {
    DioHelper.init();
    DioHelper.postData(
      url: "login",
      data:
      {
        'username' :username,
        'password' :pass
      },
    ).then((value){
      userModel = UserModel.fromJson(value.data);
      if (value.data != null) {
        Person = UserModel.fromJson(value.data);
        print(Person.email);
        emit(LoginSuccess());
        isLoading = false;

      }
    }).catchError((error)
    {
      print(error.toString());
      emit(LoginFailure(errorMeassage:error.toString()));
      isLoading = false;
    });
  }


  void onRememberMeChanged(bool? newValue) {
    rememberMe = newValue!;
    print("${newValue}");
  }

  void submitFormOnLogin(
      {required String username, required String pass}) async {
    emit(LoginLoading());
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      try {
          formKey.currentState!.save();
        LoginByApi(username: username!, pass: pass!);
          isLoading = true;
      } catch (e) {
        emit(LoginFailure(errorMeassage:e.toString()));
        isLoading = false;
      }
    }
  }

}
