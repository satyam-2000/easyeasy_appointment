class LoginResponseModel{
  String id;
  String? name;
  LoginResponseModel({required this.id,this.name});

  factory LoginResponseModel.fromJson(Map<String,dynamic> json){
    return LoginResponseModel(id: json["_id"], name: json["name"]);
  }
}

class LoginRequestModel{
  String email;
  String password;
  LoginRequestModel({required this.email,required this.password});

  Map<String,dynamic> toJson(){
    return {
      "email":email,
      "password":password
    };
  }
}