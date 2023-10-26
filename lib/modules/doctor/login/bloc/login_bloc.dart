import 'package:easy_appointment/modules/patient/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/login_repo.dart';
import 'login_event.dart';
import 'login_state.dart';

class DoctorLoginBloc extends Bloc<DoctorLoginEvent,DoctorLoginState>{
  DoctorLoginBloc():super(DoctorLoginInitialState()){
    on<DoctorLoginSubmittedEvent>((event,emit) async {
      emit(DoctorLoginLoadingState());
      var loginResponseModel=await DoctorLoginRepository.login(event.doctorLoginRequestModel.toJson());
      if(loginResponseModel==null){
        emit(DoctorLoginErrorState(error: "Something went wrong"));
      }
      else if(loginResponseModel==401){
        emit(DoctorLoginErrorState(error: "User does not exist"));
      }
      else if(loginResponseModel==400){
        emit(DoctorLoginErrorState(error: "Incorrect Password"));
      }
      else{
        emit(DoctorLoginSuccessState(loginResponseModel: loginResponseModel));
      }


    });
  }
}