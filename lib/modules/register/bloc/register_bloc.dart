import 'package:easy_appointment/modules/register/bloc/register_event.dart';
import 'package:easy_appointment/modules/register/bloc/register_state.dart';
import 'package:easy_appointment/modules/register/services/register_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent,RegisterState>{
  RegisterBloc():super(RegisterInitialState()){
    on<RegisterSubmittedEvent>((event,emit) async {
      emit(RegisterLoadingState());
      bool result=await RegisterRepository.register(event.registerModel.toJson());
      if(result==true){
        emit(RegisterSuccessState());
      }
      else{
        emit(RegisterErrorState());
      }
    });
  }
}