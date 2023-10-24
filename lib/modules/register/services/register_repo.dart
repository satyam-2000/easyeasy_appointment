import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../utils/constants/api_constant.dart';

abstract class RegisterRepository{

  static Future<bool>  register(Map<String,dynamic> registerRequest) async{
    log(ApiConstants.register);
    print(registerRequest);
    final dio = Dio();
    try{
      final response = await dio.post(ApiConstants.register,data: json.encode(
        registerRequest
      ));
      print(response.data);
      if(response.statusCode==200){
        return true;
      }
      else{
        return false;
      }
    }
    on DioException catch(e){
      print(e.response?.data);
      log(e.message??"");
      return false;
    }
  }

}