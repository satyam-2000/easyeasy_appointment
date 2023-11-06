class DoctorModel{
  String id;
  String name;
  String phone;
  String email;
  String speciality;
  String? qualification;
  String? photo;
  String? experience;

  DoctorModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.speciality,
    this.qualification,
    this.photo,
    this.experience
  });

  factory DoctorModel.fromJson(Map<String,dynamic> json){
    return DoctorModel(
        id: json["_id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        speciality: json["role"],
        qualification:json["qualification"],
        photo: json["photo"],
        experience: json["experienced"]
    );
  }
}