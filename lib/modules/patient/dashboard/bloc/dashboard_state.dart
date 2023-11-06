import 'package:easy_appointment/modules/patient/dashboard/model/doctor_model.dart';

abstract class DashboardState{}

class DashboardInitialState extends DashboardState{}
class GetDoctorLoadingState extends DashboardState{}
class GetDoctorSuccessState extends DashboardState{
  List<DoctorModel> doctors;
  GetDoctorSuccessState({required this.doctors});
}
class GetDoctorErrorState extends DashboardState{}