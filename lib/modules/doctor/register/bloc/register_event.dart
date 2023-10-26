import '../model/register_model.dart';

abstract class DoctorRegisterEvent{}

class DoctorRegisterSubmittedEvent extends DoctorRegisterEvent{
  DoctorRegisterModel doctorRegisterModel;
  DoctorRegisterSubmittedEvent({required this.doctorRegisterModel});
}