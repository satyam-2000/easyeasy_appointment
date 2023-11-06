import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_appointment/modules/patient/dashboard/model/doctor_model.dart';
import '../../../../utils/constants/api_constant.dart';


abstract class DashboardRepository{

  static Future<List<DoctorModel>?>  getAllDoctors() async{
    log(ApiConstants.doctor);
    final dio = Dio();
    try{
      final response = await dio.get(ApiConstants.doctor);
      print(response.data);
      if(response.statusCode==200){
        List<dynamic> doctors=response.data["data"];
        List<DoctorModel> allDoctors=[];
        for(var doctor in doctors){
          allDoctors.add(DoctorModel.fromJson(doctor));
        }
        return allDoctors;
      }
    }
    on DioException catch(e){
      print(e.response?.data);
      log(e.message??"");
      return null;
    }
  }



}