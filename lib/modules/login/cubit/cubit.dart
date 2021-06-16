import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:elshaima/models/elshaima_app/login_model.dart';
import 'package:elshaima/modules/login/cubit/statas.dart';
import 'package:elshaima/shared/components/constance.dart';
import 'package:elshaima/shared/network/end_points.dart';
import 'package:elshaima/shared/network/local/chach_helper.dart';
import 'package:elshaima/shared/network/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElshaimaLoginCubit extends Cubit<ElshaimaLoginStates> {
  ElshaimaLoginCubit() : super(ElshaimaLoginInitialState());
  static ElshaimaLoginCubit get(context) => BlocProvider.of(context);
  ElshaimaLoginModel loginModel;
  void userLogin({
    @required String username,
    @required String password,
  }) {
    emit(ElshaimaLoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'username': username,
      'password': password,
    }).then((value) {
      print(value.data);
      loginModel = ElshaimaLoginModel.fromJson(value.data);
      emit(ElshaimaLoginSuccessState(loginModel));
    }). catchError((error) {
      print("uuu");
      print(error.toString());

      emit(ElshaimaLoginErrorState(error.toString()));
    });
  }


  void UpdateToken({
    @required int id,
    // ignore: non_constant_identifier_names
    @required String fcm_token,
  }) {
    emit(ElshaimaUpdateTokenState());
    DioHelper.postData(
        url: UPDATETOKEN,
        token: Token,
        data: {
          'id': id,
          'fcm_token': fcm_token,
        }).then((value) {
      print(value.data);

      emit(ElshaimaUpdateTokenSuccessState());
    }).catchError((error) {
      print("ttt");
      print(error.toString());
      emit(ElshaimaUpdateTokenErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShow = true;
  void changePasswordVisibility() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(ElshaimaChangePasswordVisibilityState());
  }
}
