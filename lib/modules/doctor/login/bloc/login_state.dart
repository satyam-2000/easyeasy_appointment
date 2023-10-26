import 'package:easy_appointment/modules/patient/login/models/login_model.dart';

import '../model/login_model.dart';

abstract class DoctorLoginState{}

class DoctorLoginInitialState extends DoctorLoginState{}
class DoctorLoginLoadingState extends DoctorLoginState{}
class DoctorLoginSuccessState extends DoctorLoginState{
  DoctorLoginResponseModel loginResponseModel;
  DoctorLoginSuccessState({required this.loginResponseModel});
}
class DoctorLoginErrorState extends DoctorLoginState{
  String error;
  DoctorLoginErrorState({required this.error});
}