import 'package:easy_appointment/common_components/widgets/custom_button.dart';
import 'package:easy_appointment/modules/auth/bloc/auth_bloc.dart';
import 'package:easy_appointment/modules/auth/bloc/login_event.dart';
import 'package:easy_appointment/modules/auth/bloc/login_state.dart';
import 'package:easy_appointment/modules/patient/login/models/login_model.dart';
import 'package:easy_appointment/utils/constants/color_constants.dart';
import 'package:easy_appointment/utils/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common_components/widgets/input_text_field.dart';
import '../../../common_components/widgets/snackBars.dart';
import '../../../utils/services/validators.dart';

class AuthScreen extends StatefulWidget {
  final bool isDoctor;
  const AuthScreen({Key? key,required this.isDoctor}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final formGlobalKey = GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          child: Stack(
            children: [
              Image.asset(widget.isDoctor?ImageConstants.doctor_bg:ImageConstants.patient_bg,width: screenWidth,fit: BoxFit.fitWidth,height: screenHeight*0.35,),
              Positioned(
                top:screenHeight*0.30,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 40),
                    child: Column(
                      children: [
                        InputTextField2(hintText: "Login via OTP",controller: phoneController,),
                        const SizedBox(height: 10,),
                        ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: widget.isDoctor?AppColors.doctorThemeColor:AppColors.patientThemeColor), child: const Text("Get OTP"),),
                        const SizedBox(height: 30,),
                        Row(
                          children: [
                            Expanded(child: Container(height: 2,color: Colors.black,)),
                            const Text(" or ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                            Expanded(child: Container(height: 2,color: Colors.black,)),
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Form(
                          key: formGlobalKey,
                          child: Column(
                            children: [
                              Material(
                                color:Colors.transparent,
                              elevation: 20.0,
                              shadowColor: Colors.blue,
                              child: InputTextField2(hintText: "Email ID",controller: emailController,validator:(email)=>Validators.emailValidator(email))),
                              const SizedBox(height: 20,),
                              InputTextField2(hintText: "Password",controller: passwordController,isObscure: true,validator:(password)=>Validators.passwordValidator(password)),
                              const SizedBox(height: 10,),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("Forgot Password?",style: TextStyle(fontWeight: FontWeight.w500),)],),
                              const SizedBox(height: 30,),
                              BlocConsumer<AuthBloc,AuthState>(
                                listener: (context,state){
                                  if(state is AuthErrorState){
                                    SnackBars.error(error:state.error, context: context);
                                  }
                                  if(state is DoctorLoginSuccessState){
                                    SnackBars.success(message: "Login Succesfull", context: context);
                                    emailController.clear();
                                    passwordController.clear();
                                  }
                                  if(state is PatientLoginSuccessState){
                                    SnackBars.success(message: "Login Succesfull", context: context);
                                    emailController.clear();
                                    passwordController.clear();
                                  }
                                },
                                builder: (context,state){
                                  if(state is AuthLoadingState){
                                    return const Center(child: CircularProgressIndicator(),);
                                  }
                                  return GestureDetector(
                                      onTap: (){
                                        LoginRequestModel loginRequestModel=LoginRequestModel(email: emailController.text, password: passwordController.text);
                                        if(formGlobalKey.currentState!.validate()){
                                          BlocProvider.of<AuthBloc>(context).add(AuthSubmittedEvent(loginRequestModel: loginRequestModel, isDoctor: widget.isDoctor));
                                        }
                                      },
                                      child: CustomButton(text: "Login", color: widget.isDoctor?AppColors.doctorThemeColor:AppColors.patientThemeColor));
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
