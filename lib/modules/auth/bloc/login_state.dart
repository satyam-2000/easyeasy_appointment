import '../models/doctor_login_model.dart';
import '../models/patient_login_model.dart';

abstract class AuthState{}

class AuthInitialState extends AuthState{}
class AuthLoadingState extends AuthState{}
class DoctorLoginSuccessState extends AuthState{
  DoctorLoginResponseModel doctorLoginResponseModel;
  DoctorLoginSuccessState({required this.doctorLoginResponseModel});
}
class PatientLoginSuccessState extends AuthState{
  LoginResponseModel loginResponseModel;
  PatientLoginSuccessState({required this.loginResponseModel});
}
class AuthErrorState extends AuthState{
  String error;
  AuthErrorState({required this.error});
}