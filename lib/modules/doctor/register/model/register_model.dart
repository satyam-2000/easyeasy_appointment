class DoctorRegisterModel{
  String name;
  String email;
  String phone;
  String password;
  String qualification;
  String speciality;
  String experience;
  String? photo;

  DoctorRegisterModel({
    required this.name,
    required this.phone,
    required this.password,
    required this.email,
    required this.qualification,
    required this.speciality,
    required this.experience,
    this.photo
  });

  Map<String,dynamic> toJson(){
    return {
      "name":name,
      "phone":phone,
      "email":email,
      "password":password,
      "role":speciality,
      "qualification":qualification,
      "experienced":experience,
      "photo":photo
    };
  }
}