import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

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
    // http.Response response=await http.post(Uri.parse("https://easy-appointments-z8ge.onrender.com/api/user/register"),
    // body: json.encode({
    //   "name":"abhay",
    //   "age":"15",
    //   "password":"12345",
    //   "phone" :"926497680",
    //   "gender" :"male",
    //   "email":"abhay@lll.com"
    // })
    // );
  }

}