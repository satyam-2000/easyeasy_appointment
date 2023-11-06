import 'package:easy_appointment/modules/auth/services/auth_service.dart';
import 'package:easy_appointment/modules/patient/login/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState>{
  AuthBloc():super(AuthInitialState()){
    on<AuthSubmittedEvent>((event,emit) async {
      emit(AuthLoadingState());
      var registerResponse=await AuthRepository.register(registerRequest: event.loginRequestModel.toJson(),isDoctor: event.isDoctor);
      if(registerResponse==null){
        print("B1");
        emit(AuthErrorState(error: "Something Went Wrong"));
      }
      else{
        print("B2");
        var loginResponse=await AuthRepository.login(loginRequest: event.loginRequestModel.toJson(), isDoctor: event.isDoctor);
        if(loginResponse==null){
          emit(AuthErrorState(error: "Something Went Wrong"));
        }
        else if(loginResponse==400){
          emit(AuthErrorState(error: "Incorrect Password"));
        }
        else{
          if(event.isDoctor){
            emit(DoctorLoginSuccessState(doctorLoginResponseModel: loginResponse));
          }
          else{
            emit(PatientLoginSuccessState(loginResponseModel: loginResponse));
          }
        }
      }
    });
  }
}