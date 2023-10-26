abstract class DoctorRegisterState{}

class DoctorRegisterInitialState extends DoctorRegisterState{}

class DoctorRegisterLoadingState extends DoctorRegisterState{}

class DoctorRegisterErrorState extends DoctorRegisterState{
  String error;
  DoctorRegisterErrorState({required this.error});
}

class DoctorRegisterSuccessState extends DoctorRegisterState{}