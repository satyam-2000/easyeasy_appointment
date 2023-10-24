import 'package:easy_appointment/modules/dashboard/screens/dashboard.dart';
import 'package:easy_appointment/modules/login/bloc/login_bloc.dart';
import 'package:easy_appointment/modules/login/bloc/login_state.dart';
import 'package:easy_appointment/modules/login/models/login_model.dart';
import 'package:easy_appointment/modules/register/bloc/register_bloc.dart';
import 'package:easy_appointment/modules/register/screens/register_screen.dart';
import 'package:easy_appointment/utils/services/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common_components/widgets/input_text_field.dart';
import '../../../common_components/widgets/snackBars.dart';
import '../bloc/login_event.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneController.clear();
    passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>LoginBloc(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Easy Appointment"),backgroundColor: Colors.blue.shade800,),
        body: BlocListener<LoginBloc,LoginState>(
          listener: (context,state){
            if(state is LoginErrorState){
              SnackBars.error(error: "Invalid Phone or Password", context: context);
            }
            if(state is LoginSuccessState){
              SnackBars.success(message: "Login Successfull", context: context);
              Future.delayed(const Duration(seconds: 1));
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DashboardScreen(patientDetails: state.loginResponseModel)));
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.medical_services,size: 60,color: Colors.blue.shade800,),
                    const SizedBox(height: 20,),
                    Text("LOGIN",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.blue.shade800),),
                    Divider(),
                    const SizedBox(height: 30,),
                    Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [
                          InputTextField(controller: phoneController,label: "Mobile Number",validator:(number)=>Validators.phoneValidator(number),textInputType: TextInputType.phone,),
                          const SizedBox(height: 20,),
                          InputTextField(controller: passwordController,label: "Password",isObscure:true,validator: (password)=>Validators.passwordValidator(password),),
                          const SizedBox(height: 20,),
                          BlocBuilder<LoginBloc,LoginState>(
                            builder:(context,state){
                              if(state is LoginLoadingState){
                                return const Center(child: CircularProgressIndicator(),);
                              }
                              return ElevatedButton(onPressed: (){
                                if(formGlobalKey.currentState!.validate()){
                                  LoginRequestModel loginRequestModel=LoginRequestModel(phone: phoneController.text, password: passwordController.text);
                                  BlocProvider.of<LoginBloc>(context).add(LoginSubmittedEvent(loginRequestModel: loginRequestModel));
                                }
                              },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800), child: const Text("Login"),);
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
                                  create: (context)=>RegisterBloc(),
                                  child: RegisterScreen())));
                            },
                            child: Text("Register",style: TextStyle(color: Colors.blue.shade800,fontWeight: FontWeight.bold),))
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
