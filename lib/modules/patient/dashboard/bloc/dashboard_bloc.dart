import 'package:easy_appointment/modules/patient/dashboard/bloc/dashboard_event.dart';
import 'package:easy_appointment/modules/patient/dashboard/bloc/dashboard_state.dart';
import 'package:easy_appointment/modules/patient/dashboard/model/doctor_model.dart';
import 'package:easy_appointment/modules/patient/dashboard/services/dashboard_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent,DashboardState>{
  DashboardBloc():super(DashboardInitialState()){
    on<GetAllDoctorsEvent>((event,emit) async {
      emit(GetDoctorLoadingState());
      List<DoctorModel>? result=await DashboardRepository.getAllDoctors();
      if(result==null){
        emit(GetDoctorErrorState());
      }
      else{
        emit(GetDoctorSuccessState(doctors: result));
      }
    });
  }
}