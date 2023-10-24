class RegisterModel{
  String name;
  String phone;
  String password;

  RegisterModel({
    required this.name,
    required this.phone,
    required this.password
  });

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "phone":phone,
      "password":password
    };
  }
}