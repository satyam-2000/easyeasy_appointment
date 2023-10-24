import 'package:easy_appointment/modules/register/bloc/register_bloc.dart';
import 'package:easy_appointment/modules/register/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common_components/widgets/input_text_field.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Easy Appointment"),backgroundColor: Colors.blue.shade800,),
      body: Center(
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
              InputTextField(controller: emailController,label: "Email Id",),
              const SizedBox(height: 20,),
              InputTextField(controller: passwordController,label: "Password",isObscure:true),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800), child: const Text("Login"),),
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
    );
  }
}
