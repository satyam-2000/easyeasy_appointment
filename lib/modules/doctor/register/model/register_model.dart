class DoctorRegisterModel{
  String name;
  String email;
  String phone;
  String password;
  String qualification;
  String speciality;

  DoctorRegisterModel({
    required this.name,
    required this.phone,
    required this.password,
    required this.email,
    required this.qualification,
    required this.speciality
  });

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "phone":phone,
      "email":email,
      "password":password,
      "role":speciality,
      "qualification":qualification
    };
  }
}