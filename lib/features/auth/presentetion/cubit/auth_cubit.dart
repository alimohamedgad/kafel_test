import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:kafel_project/core/api_services/dio_helpler.dart';
import 'package:kafel_project/features/auth/data/data_source/remote_user_data_source.dart';
import 'package:kafel_project/features/auth/data/model/data_user_model.dart';
import 'package:kafel_project/features/auth/data/model/user_model.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/api_constant.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final RemoteUserDataSource userDataSource;
  AuthCubit(this.userDataSource) : super(AuthInitial());
  UserModel? loginModel;
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    userDataSource.post(
      endPoint: loginEndPoint,
      contentTyp: 'application/json',
      data: {
        "email": email,
        "password": password,
      },
    ).then((response) {
      if (response.statusCode == 200) {
        loginModel = UserModel.fromJson(response.data);
      }
      emit(LoginSuccess());
    }).catchError((e) {
      log(e.toString());
      emit(LoginError());
    });
  }

  UserModel? signUpModel;

  Future<void> signUp(DataUserModel model) async {
    emit(SignUpLoading());
    userDataSource
        .post(
      endPoint: signUpEndPoint,
      contentTyp: "multipart/form-data",
      data: model.toMap(),
    )
        .then((response) {
      print(response.data);
      if (response.statusCode == 200) {
        signUpModel = UserModel.fromJson(response.data['data']);
      }
      emit(SignUpSuccess());
    }).catchError((e) {
      log(e.toString());
      emit(DecrementState());
    });
  }

  int salary = 100;
  increment() {
    if (salary < 100) {
      return;
    }
    salary = salary + 100;
    emit(IncrementState());
  }

  decrement() {
    if (salary == 100) {
      return;
    }
    salary = salary - 100;
    emit(DecrementState());
  }
}
