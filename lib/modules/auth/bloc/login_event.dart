import 'package:easy_appointment/modules/patient/login/models/login_model.dart';

abstract class AuthEvent{}

class AuthSubmittedEvent extends AuthEvent{
  LoginRequestModel loginRequestModel;
  bool isDoctor;
  AuthSubmittedEvent({required this.loginRequestModel,required this.isDoctor});
}