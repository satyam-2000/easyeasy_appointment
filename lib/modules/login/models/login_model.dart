class LoginResponseModel{
  String id;
  String name;
  LoginResponseModel({required this.id,required this.name});

  factory LoginResponseModel.fromJson(Map<String,dynamic> json){
    return LoginResponseModel(id: json["_id"], name: json["name"]);
  }
}

class LoginRequestModel{
  String phone;
  String password;
  LoginRequestModel({required this.phone,required this.password});

  Map<String,dynamic> toJson(){
    return {
      "phone":phone,
      "password":password
    };
  }
}