import 'package:easy_appointment/modules/login/models/login_model.dart';

abstract class LoginEvent{}

class LoginSubmittedEvent extends LoginEvent{
  LoginRequestModel loginRequestModel;
  LoginSubmittedEvent({required this.loginRequestModel});
}