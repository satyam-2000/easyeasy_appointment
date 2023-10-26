import 'package:easy_appointment/modules/patient/login/models/login_model.dart';

import '../model/login_model.dart';

abstract class DoctorLoginEvent{}

class DoctorLoginSubmittedEvent extends DoctorLoginEvent{
  DoctorLoginRequestModel doctorLoginRequestModel;
  DoctorLoginSubmittedEvent({required this.doctorLoginRequestModel});
}