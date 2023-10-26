class DoctorLoginResponseModel{
  String id;
  String name;
  String email;
  String phone;
  String speciality;
  bool isApproved;
  DoctorLoginResponseModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.speciality,
    required this.isApproved
  });

  factory DoctorLoginResponseModel.fromJson(Map<String,dynamic> json){
    return DoctorLoginResponseModel(
        id: json["doctorData"]["_id"],
        name: json["doctorData"]["name"],
        phone: json["doctorData"]["phone"],
        email: json["doctorData"]["email"],
        speciality: json["doctorData"]["role"],
        isApproved: json["isApproved"]
    );
  }
}

class DoctorLoginRequestModel{
  String email;
  String password;
  DoctorLoginRequestModel({required this.email,required this.password});

  Map<String,dynamic> toJson(){
    return {
      "email":email,
      "password":password
    };
  }
}