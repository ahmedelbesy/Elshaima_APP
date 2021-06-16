

import 'package:conditional_builder/conditional_builder.dart';
import 'package:elshaima/modules/child/child_view.dart';

import 'package:elshaima/modules/login/cubit/cubit.dart';
import 'package:elshaima/modules/login/cubit/statas.dart';
import 'package:elshaima/shared/components/components.dart';
import 'package:elshaima/shared/components/constance.dart';
import 'package:elshaima/shared/network/local/chach_helper.dart';

import 'package:elshaima/shared/styles/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatelessWidget {
  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (BuildContext context) => ElshaimaLoginCubit(),
        child: BlocConsumer<ElshaimaLoginCubit, ElshaimaLoginStates>(
          listener: (context, state) {
            if (state is ElshaimaLoginSuccessState) {
              if (state.loginModel.msg == "login successful") {
                CacheHelper.saveData(
                        key: "token", value: state.loginModel.token)
                    .then((value) {
                  Token = state.loginModel.token;
                  navigateAndFinish(context, ChildScreen());
                  Fluttertoast.showToast(
                      msg: state.loginModel.msg,
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);
                  CacheHelper.saveData(
                      key: 'id', value: state.loginModel.data.id);
                  CacheHelper.saveData(
                      key: 'name', value: state.loginModel.data.name);
                  CacheHelper.saveData(
                      key: 'phone', value: state.loginModel.data.phone);
                  CacheHelper.saveData(
                      key: 'username', value: state.loginModel.data.username);

                  if (state is ElshaimaLoginSuccessState) {
                    ID = CacheHelper.getData(key: 'id');

                    if (ID != null) {
                      ElshaimaLoginCubit.get(context)
                          .UpdateToken(id: ID, fcm_token: TokenDevice);
                    } else {
                      print("ID NULL");
                    }
                  } else {
                    print("Login Errors");
                  }
                });
              } else {
                return Fluttertoast.showToast(
                    msg: state.loginModel.msg,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            }
          },
          builder: (context, state) {
            return Form(
              key: formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.jpg'),
                          height: 150.0,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: "دار الشيماء لتحفيظ القران الكريم",
                          alignment: Alignment.center,
                          color: primaryColor,
                          fontSize: 30,
                          fontweight: FontWeight.bold,
                          fontFamily: 'ArefRuqaa',
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          //   type: TextInputType.phone,
                          controller: userController,
                          // ignore: missing_return
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'تاكد من رقم الموبايل';
                            }
                          },
                          hint: "ادخل رقم الموبايل",
                          suffixIcon: Icon(
                            Icons.phone,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          type: TextInputType.visiblePassword,
                          //   obscureText: true,
                          onFieldSubmitted: (value) {
                            if (formKey.currentState.validate()) {
                              ElshaimaLoginCubit.get(context).userLogin(
                                username: userController.text,
                                password: passwordController.text,
                              );
                              //
                              // ElshaimaLoginCubit.get(context).UpdateToken(
                              //     id: CacheHelper.getData(key: 'id'),
                              //     fcm_token: TokenDevice);
                            }
                          },
                          controller: passwordController,
                          onpressedPrefix: () {
                            ElshaimaLoginCubit.get(context)
                                .changePasswordVisibility();
                          },

                          prefixIcon: ElshaimaLoginCubit.get(context).suffix,
                          isPassword:
                              ElshaimaLoginCubit.get(context).isPasswordShow,
                          // ignore: missing_return
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'تاكد من كلمة المرور';
                            }
                          },
                          hint: 'ادخل كلمة المرور',
                          suffixIcon: Icon(
                            Icons.lock,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! ElshaimaLoginLoadingState,
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                          builder: (context) => Container(
                            width: double.infinity,
                            height: 70,
                            child: defaultButton(
                              text: "تسجيل الدخول",
                              color: Colors.white,
                              fontSize: 23,
                              function: () {
                                if (formKey.currentState.validate()) {
                                  ElshaimaLoginCubit.get(context).userLogin(
                                    username: userController.text,
                                    password: passwordController.text,
                                  );

                                  // ElshaimaLoginCubit.get(context).UpdateToken(
                                  //     id: CacheHelper.getData(key: 'id'),
                                  //     fcm_token: TokenDevice);
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
