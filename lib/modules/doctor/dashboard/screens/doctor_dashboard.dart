import 'package:easy_appointment/modules/doctor/login/model/login_model.dart';
import 'package:easy_appointment/modules/doctor/widgets/doctor_drawer.dart';
import 'package:easy_appointment/modules/patient/dashboard/bloc/dashboard_bloc.dart';
import 'package:easy_appointment/modules/patient/dashboard/bloc/dashboard_event.dart';
import 'package:easy_appointment/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorDashboardScreen extends StatefulWidget {
  final DoctorLoginResponseModel doctorDetails;
  const DoctorDashboardScreen({Key? key,required this.doctorDetails}) : super(key: key);

  @override
  State<DoctorDashboardScreen> createState() => _DoctorDashboardScreenState();
}

class _DoctorDashboardScreenState extends State<DoctorDashboardScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Easy Appointment"),
        backgroundColor: AppColors.doctorThemeColor,
      ),
      drawer: DoctorDrawer(doctorDetails: widget.doctorDetails,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Welcome!!",style: TextStyle(fontWeight: FontWeight.bold),),
            const SizedBox(height: 15,),
            Text("Dr. ${widget.doctorDetails.name}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
