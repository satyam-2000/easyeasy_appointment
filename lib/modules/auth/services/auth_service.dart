import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../models/doctor_login_model.dart';
import '../models/patient_login_model.dart';
import '../../../../utils/constants/api_constant.dart';

abstract class AuthRepository{

  static Future<dynamic>  login({required Map<String,dynamic> loginRequest,required bool isDoctor}) async{
    String url;
    if(isDoctor){
      url=ApiConstants.doctorLogin;
    }
    else{
      url=ApiConstants.patientLogin;
    }
    final dio = Dio();
    try{
      print("Login Request $loginRequest");
      log(url);
      final response = await dio.post(url,data: json.encode(
          loginRequest
      ));
      print(response.data);
      if(response.statusCode==200){
        if(isDoctor){
          return DoctorLoginResponseModel.fromJson(response.data);
        }
        else{
          return LoginResponseModel.fromJson(response.data["userData"]);
        }
      }
    }
    on DioException catch(e){
      print(e.response?.data);
      log(e.message??"");
      if(e.response!=null){
        if(e.response!.statusCode==400){
          return 400;
        }
      }
      else{
        return null;
      }
    }
  }


  static Future<dynamic>  register({required Map<String,dynamic> registerRequest,required bool isDoctor}) async{
    String url;
    if(isDoctor){
      url=ApiConstants.doctorRegister;
    }
    else{
      url=ApiConstants.patientRegister;
    }
    log(url);
    print(registerRequest);
    final dio = Dio();
    try{
      final response = await dio.post(url,data: json.encode(
          registerRequest
      ));
      print(response.data);
      return response.statusCode!;
    }
    on DioException catch(e){
      if(e.response!=null){
        if(e.response!.statusCode==401){
          return 401;
        }
      }
      return null;
    }
  }

}