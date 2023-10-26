import 'package:easy_appointment/common_components/widgets/snackBars.dart';
import 'package:easy_appointment/modules/doctor/register/bloc/register_bloc.dart';
import 'package:easy_appointment/modules/doctor/register/bloc/register_event.dart';
import 'package:easy_appointment/modules/doctor/register/bloc/register_state.dart';
import 'package:easy_appointment/modules/doctor/register/model/register_model.dart';
import 'package:easy_appointment/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common_components/widgets/dropdown.dart';
import '../../../../common_components/widgets/input_text_field.dart';
import '../../../../utils/services/validators.dart';

class DoctorRegisterScreen extends StatefulWidget {
  const DoctorRegisterScreen({Key? key}) : super(key: key);

  @override
  State<DoctorRegisterScreen> createState() => _DoctorRegisterScreenState();
}

class _DoctorRegisterScreenState extends State<DoctorRegisterScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController qualificationController=TextEditingController();
  List<DropDownItem> specialities=const [
    DropDownItem(name: "General Physician"),
    DropDownItem(name: "Cardiologist"),
    DropDownItem(name: "Gynecologist"),
    DropDownItem(name: "Dentist"),
    DropDownItem(name: "Gaestrologist"),
    DropDownItem(name: "Urologist"),
  ];
  DropDownItem selectedSpeciality=const DropDownItem(name: "Select");
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(title: const Text("Easy Appointment"),backgroundColor: AppColors.doctorThemeColor,),
        body: BlocListener<DoctorRegisterBloc,DoctorRegisterState>(
          listener: (context,state){
            if(state is DoctorRegisterErrorState){
              SnackBars.error(error: state.error, context: context);
            }
            if(state is DoctorRegisterSuccessState){
              SnackBars.success(message: "Successfully Registered", context: context);
              Navigator.pop(context);
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.medical_services,size: 60,color: AppColors.doctorThemeColor,),
                    const SizedBox(height: 20,),
                    Text("REGISTER",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:AppColors.doctorThemeColor),),
                    const Divider(),
                    const SizedBox(height: 30,),
                    Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [
                          InputTextField(controller: nameController,label: "Name",validator:(name)=>Validators.nameValidator(name),themeColor: AppColors.doctorThemeColor,),
                          const SizedBox(height: 20,),
                          InputTextField(controller: phoneController,label: "Mobile Number",textInputType: TextInputType.phone,validator:(phone)=>Validators.phoneValidator(phone),themeColor: AppColors.doctorThemeColor),
                          const SizedBox(height: 20,),
                          InputTextField(controller: emailController,label: "Email",validator:(email)=>Validators.emailValidator(email),themeColor: AppColors.doctorThemeColor),
                          const SizedBox(height: 20,),
                          InputTextField(controller: passwordController,label: "Password",isObscure:true,validator:(password)=>Validators.passwordValidator(password),themeColor: AppColors.doctorThemeColor,),
                          const SizedBox(height: 20,),
                          InputTextField(controller: qualificationController,label: "Qualification",validator:(name)=>Validators.nameValidator(name),themeColor: AppColors.doctorThemeColor,),
                          const SizedBox(height: 20,),
                          DropDownWidget(
                            title: "Speciality",
                            options: specialities,
                            onChanged: (value){
                              setState(() {
                                selectedSpeciality=value;
                              });
                            },
                            selectedItem: selectedSpeciality,
                          ),
                          const SizedBox(height: 20,),
                          BlocBuilder<DoctorRegisterBloc,DoctorRegisterState>(builder: (context,state){
                            if(state is DoctorRegisterLoadingState){
                              return Center(child: CircularProgressIndicator(color: AppColors.doctorThemeColor,),);
                            }
                            return ElevatedButton(onPressed: (){
                              if(formGlobalKey.currentState!.validate()){
                                if(selectedSpeciality.name!="Select"){
                                  DoctorRegisterModel doctorRegisterRequest=DoctorRegisterModel(name: nameController.text,
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                      email: emailController.text,
                                      qualification: qualificationController.text, speciality: selectedSpeciality.name);
                                  BlocProvider.of<DoctorRegisterBloc>(context).add(DoctorRegisterSubmittedEvent(doctorRegisterModel: doctorRegisterRequest));
                                }
                                else{
                                  SnackBars.error(error: "Speciality is required", context: context);
                                }
                              }
                            },style: ElevatedButton.styleFrom(backgroundColor: AppColors.doctorThemeColor), child: const Text("Register"),);
                          })
                        ],
                      ),
                    ),
                    const SizedBox(height: 100,),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}
