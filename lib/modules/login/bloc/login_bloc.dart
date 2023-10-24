import 'dart:developer';

import 'package:easy_appointment/modules/login/bloc/login_state.dart';
import 'package:easy_appointment/modules/login/models/login_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/login_repo.dart';
import 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{
  LoginBloc():super(LoginInitialState()){
    on<LoginSubmittedEvent>((event,emit) async {
      emit(LoginLoadingState());
      try{
        LoginResponseModel loginResponseModel=await LoginRepository.login(event.loginRequestModel.toJson());
        emit(LoginSuccessState(loginResponseModel: loginResponseModel));
      }
      catch(e){
        log(e.toString());
        emit(LoginErrorState());
      }
    });
  }
}