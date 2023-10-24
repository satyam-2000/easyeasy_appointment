import 'package:easy_appointment/modules/login/models/login_model.dart';

abstract class LoginState{}

class LoginInitialState extends LoginState{}
class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{
  LoginResponseModel loginResponseModel;
  LoginSuccessState({required this.loginResponseModel});
}
class LoginErrorState extends LoginState{}