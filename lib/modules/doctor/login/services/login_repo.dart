import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../utils/constants/api_constant.dart';
import '../model/login_model.dart';

abstract class DoctorLoginRepository{

  static Future<dynamic>  login(Map<String,dynamic> loginRequest) async{
    log(ApiConstants.doctorLogin);
    print(loginRequest);
    final dio = Dio();
    try{
      final response = await dio.post(ApiConstants.doctorLogin,data: json.encode(
          loginRequest
      ));
      print(response.data);
      if(response.statusCode==200){
        return DoctorLoginResponseModel.fromJson(response.data);
      }
    }
    on DioException catch(e){
      print(e.response?.data);
      log(e.message??"");
      if(e.response!=null){
        if(e.response!.statusCode==400){
          return 400;
        }
        if(e.response!.statusCode==401){
          return 401;
        }
      }
      else{
        return null;
      }
    }
  }

}