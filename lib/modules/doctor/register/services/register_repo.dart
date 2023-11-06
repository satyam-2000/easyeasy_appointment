import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../../../utils/constants/api_constant.dart';
import 'package:image_picker/image_picker.dart';

abstract class DoctorRegisterRepository{

  static Future<String?> uploadPic(XFile? pickedFile)async{
    try{
      Dio dio=Dio();
      if(pickedFile!=null){
        FormData formData=FormData.fromMap({
          'photo':await MultipartFile.fromFile(pickedFile.path,filename: 'image.jpeg'),
        });
        log(ApiConstants.upload);
        Response response=await dio.post(ApiConstants.upload,
            data: formData
        );
        print(response.data);
        if(response.statusCode==200){
          log(response.data["data"]["url"]);
          return response.data["data"]["url"];
        }
      }
    }
    on DioException catch(e){
      print(e.response!.data);
      return null;
    }
  }

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
      print(e.response!.data);
      if(e.response!=null){
        if(e.response!.statusCode==401){
          return 401;
        }
      }
      return null;
    }
  }

}