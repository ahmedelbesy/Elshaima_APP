import 'package:elshaima/models/elshaima_app/login_model.dart';

abstract class ElshaimaLoginStates{}

class ElshaimaLoginInitialState extends ElshaimaLoginStates{}
class ElshaimaLoginLoadingState extends ElshaimaLoginStates{}

class ElshaimaChildSuccessState extends ElshaimaLoginStates{}

class ElshaimaLoginSuccessState extends ElshaimaLoginStates{

  final ElshaimaLoginModel loginModel;
  ElshaimaLoginSuccessState(this.loginModel);
}
class ElshaimaLoginErrorState extends ElshaimaLoginStates{
  final String error;
  ElshaimaLoginErrorState(this.error);
}

class ElshaimaChangePasswordVisibilityState extends ElshaimaLoginStates{}


class ElshaimaUpdateTokenState extends ElshaimaLoginStates{}
class ElshaimaUpdateTokenSuccessState extends ElshaimaLoginStates{}
class ElshaimaUpdateTokenErrorState extends ElshaimaLoginStates{
  final String errorUpdateToken;
  ElshaimaUpdateTokenErrorState(this.errorUpdateToken);
}