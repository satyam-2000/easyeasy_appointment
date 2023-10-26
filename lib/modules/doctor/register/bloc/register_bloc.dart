import 'package:easy_appointment/modules/doctor/register/bloc/register_event.dart';
import 'package:easy_appointment/modules/doctor/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/register_repo.dart';

class DoctorRegisterBloc extends Bloc<DoctorRegisterEvent,DoctorRegisterState>{
  DoctorRegisterBloc():super(DoctorRegisterInitialState()){
    on<DoctorRegisterSubmittedEvent>((event,emit) async {
      emit(DoctorRegisterLoadingState());
      var result=await DoctorRegisterRepository.register(event.doctorRegisterModel.toJson());
      if(result==200){
        emit(DoctorRegisterSuccessState());
      }
      else if(result==401){
        emit(DoctorRegisterErrorState(error: "Email already Registered"));
      }
      else{
        emit(DoctorRegisterErrorState(error: "Something went wrong"));
      }
    });
  }
}