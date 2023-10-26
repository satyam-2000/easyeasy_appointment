import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../utils/constants/api_constant.dart';

abstract class DoctorRegisterRepository{

  static Future<dynamic>  register(Map<String,dynamic> registerRequest) async{
    log(ApiConstants.doctorRegister);
    print(registerRequest);
    final dio = Dio();
    try{
      final response = await dio.post(ApiConstants.doctorRegister,data: json.encode(
          registerRequest
      ));
      print(response.data);
      return response.statusCode;
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