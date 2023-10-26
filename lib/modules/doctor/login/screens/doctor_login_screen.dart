import 'package:easy_appointment/modules/doctor/login/model/login_model.dart';
import 'package:easy_appointment/modules/doctor/register/bloc/register_bloc.dart';
import 'package:easy_appointment/modules/doctor/register/screens/register_screen.dart';
import 'package:easy_appointment/modules/patient/dashboard/screens/dashboard.dart';
import 'package:easy_appointment/modules/patient/login/bloc/login_bloc.dart';
import 'package:easy_appointment/modules/patient/login/bloc/login_state.dart';
import 'package:easy_appointment/modules/patient/register/bloc/register_bloc.dart';
import 'package:easy_appointment/utils/constants/color_constants.dart';
import 'package:easy_appointment/utils/services/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common_components/widgets/input_text_field.dart';
import '../../../../common_components/widgets/snackBars.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';



class DoctorLoginScreen extends StatefulWidget {
  const DoctorLoginScreen({Key? key}) : super(key: key);

  @override
  State<DoctorLoginScreen> createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorLoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>DoctorLoginBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Easy Appointment"),backgroundColor: Colors.teal,),
        body: BlocListener<DoctorLoginBloc,DoctorLoginState>(
          listener: (context,state){
            if(state is DoctorLoginErrorState){
              SnackBars.error(error: state.error, context: context);
            }
            if(state is DoctorLoginSuccessState){
              SnackBars.success(message: "Login Successful", context: context);
              Future.delayed(const Duration(seconds: 1));
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardScreen(patientDetails: state.loginResponseModel)));
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
                    Text("LOGIN",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: AppColors.doctorThemeColor),),
                    Divider(),
                    const SizedBox(height: 30,),
                    Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [
                          InputTextField(controller: emailController,label: "Email",validator:(email)=>Validators.emailValidator(email),themeColor: AppColors.doctorThemeColor,),
                          const SizedBox(height: 20,),
                          InputTextField(controller: passwordController,label: "Password",isObscure:true,validator: (password)=>Validators.passwordValidator(password),themeColor: AppColors.doctorThemeColor,),
                          const SizedBox(height: 20,),
                          BlocBuilder<DoctorLoginBloc,DoctorLoginState>(
                            builder:(context,state){
                              if(state is DoctorLoginLoadingState){
                                return Center(child: CircularProgressIndicator(color: AppColors.doctorThemeColor,),);
                              }
                              return ElevatedButton(onPressed: (){
                                if(formGlobalKey.currentState!.validate()){
                                  DoctorLoginRequestModel loginRequestModel=DoctorLoginRequestModel(email: emailController.text, password: passwordController.text);
                                  BlocProvider.of<DoctorLoginBloc>(context).add(DoctorLoginSubmittedEvent(doctorLoginRequestModel: loginRequestModel));
                                }
                              },style: ElevatedButton.styleFrom(backgroundColor: AppColors.doctorThemeColor), child: const Text("Login"),);
                            } ,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have Account? "),
                        GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BlocProvider(
                                  create: (context)=>DoctorRegisterBloc(),
                                  child: DoctorRegisterScreen())));
                            },
                            child: Text("Register",style: TextStyle(color: AppColors.doctorThemeColor,fontWeight: FontWeight.bold),))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
