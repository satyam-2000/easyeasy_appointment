import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:easy_appointment/modules/login/models/login_model.dart';
import '../../../utils/constants/api_constant.dart';

abstract class LoginRepository{

  static Future<LoginResponseModel>  login(Map<String,dynamic> loginRequest) async{
    log(ApiConstants.login);
    print(loginRequest);
    final dio = Dio();
    // try{
      final response = await dio.post(ApiConstants.login,data: json.encode(
          loginRequest
      ));
      print(response.data);
      // if(response.statusCode==200){
        return LoginResponseModel.fromJson(response.data["userData"]);
      // }
      // else{
      //   return false;
      // }
    // }
    // on DioException catch(e){
    //   print(e.response?.data);
    //   log(e.message??"");
    //   return false;
    // }
  }

}