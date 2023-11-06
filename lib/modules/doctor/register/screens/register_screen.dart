import 'package:easy_appointment/common_components/widgets/custom_button.dart';
import 'package:easy_appointment/modules/doctor/register/screens/register_screen2.dart';
import 'package:easy_appointment/modules/doctor/register/services/register_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:easy_appointment/common_components/widgets/snackBars.dart';
import 'package:easy_appointment/utils/constants/color_constants.dart';
import 'package:easy_appointment/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import '../../../../common_components/widgets/input_text_field.dart';
import '../../../../utils/services/validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import '../bloc/register_bloc.dart';


class DoctorRegisterScreen extends StatefulWidget {
  const DoctorRegisterScreen({Key? key}) : super(key: key);

  @override
  State<DoctorRegisterScreen> createState() => _DoctorRegisterScreenState();
}

class _DoctorRegisterScreenState extends State<DoctorRegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  final formGlobalKey = GlobalKey<FormState>();
  XFile? pickedFile;
  bool fromGallery = true;
  String? photo;
  bool isUploading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Easy Appointment"),
        backgroundColor: AppColors.doctorThemeColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child:Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(ImageConstants.logo2,width: 100,height: 100,),
                const SizedBox(height: 10,),
                Text(
                  "REGISTER",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.doctorThemeColor),
                ),
                const Divider(),
                const SizedBox(height: 30),
                isUploading?Center(child: CircularProgressIndicator(color: AppColors.doctorThemeColor,),):GestureDetector(
                  onTap: () {
                    Get.bottomSheet(Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            color: AppColors.doctorThemeColor,
                            child: Row(
                              children: [
                                const Text(
                                  "Choose Image From",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    checkPermission(fromCamera: true,context: context);
                                  },
                                child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 25,
                                child: const Text("Camera",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),))),
                                const SizedBox(height: 4,),
                                const Divider(thickness: 2,),
                                const SizedBox(height: 4,),
                                GestureDetector(
                                onTap: (){
                                  checkPermission(fromCamera: false,context: context);
                                },
                                child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 25,
                                child: const Text("Gallery",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),))),
                              ],
                            ),
                          )
                        ],
                      ),
                    ));
                  },
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(photo??ImageConstants.networkAvatar),
                        backgroundColor: Colors.grey,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          child: Icon(Icons.edit, color: Colors.white),
                          backgroundColor: AppColors.doctorThemeColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  key: formGlobalKey,
                  child: Column(
                    children: [
                      InputTextField(
                          controller: nameController,
                          label: "Name",
                          validator: (name) => Validators.nameValidator(name),
                          themeColor: AppColors.doctorThemeColor),
                      const SizedBox(height: 20),
                      InputTextField(
                        controller: phoneController,
                        label: "Mobile Number",
                        textInputType: TextInputType.phone,
                        validator: (phone) =>
                            Validators.phoneValidator(phone),
                        themeColor: AppColors.doctorThemeColor,
                      ),
                      const SizedBox(height: 20),
                      InputTextField(
                          controller: emailController,
                          label: "Email",
                          validator: (email) =>
                              Validators.emailValidator(email),
                          themeColor: AppColors.doctorThemeColor),
                      const SizedBox(height: 20),
                      InputTextField(
                          controller: passwordController,
                          label: "Password",
                          isObscure: true,
                          validator: (password) =>
                              Validators.passwordValidator(password),
                          themeColor: AppColors.doctorThemeColor),
                      const SizedBox(height: 40),
                      InkWell(
                        onTap: (){
                          if(formGlobalKey.currentState!.validate()){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return BlocProvider(
                              create: (context)=>DoctorRegisterBloc(),
                              child: RegisterSecondScreen(name: nameController.text, email: emailController.text, phone: phoneController.text, password: passwordController.text,photo: photo,));
                            }));
                          }
                        },
                        child: CustomButton(text: "CONTINUE", color: AppColors.doctorThemeColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkPermission({required bool fromCamera,required BuildContext context}) async {
    Map<Permission, PermissionStatus> statuses =
        await [Permission.camera, Permission.storage].request();
    print("Asked for permission");
    if (statuses[Permission.camera] != PermissionStatus.granted &&
        statuses[Permission.storage] != PermissionStatus.granted) {
      return;
    }
    pickedImage(fromCamera: fromCamera,context: context);
  }

  pickedImage({required bool fromCamera,required BuildContext context}) async{
    setState(() {
      isUploading=true;
    });
    if(fromCamera){
      pickedFile=await ImagePicker().pickImage(source: ImageSource.camera);
    }
    else{
      pickedFile=await ImagePicker().pickImage(source: ImageSource.gallery);
    }
    String? photoUrl=await DoctorRegisterRepository.uploadPic(pickedFile);
    photo=photoUrl;
    setState(() {
      isUploading=false;
    });
    if(photo!=null){
      SnackBars.success(message: "Image uploaded succesfully", context: context);
    }
    else{
      SnackBars.error(error: "Image couldn't upload", context: context);
    }
    Get.back();
  }
}
