import 'package:easy_appointment/modules/register/bloc/register_bloc.dart';
import 'package:easy_appointment/modules/register/bloc/register_event.dart';
import 'package:easy_appointment/modules/register/bloc/register_state.dart';
import 'package:easy_appointment/modules/register/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common_components/widgets/input_text_field.dart';
import '../../../utils/services/validators.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Easy Appointment"),backgroundColor: Colors.blue.shade800,),
      body: BlocConsumer<RegisterBloc,RegisterState>(
        listener: (context,state){
          if(state is RegisterErrorState){
            final snackbar = SnackBar(
              content: Text('User Already Registered',style: TextStyle(color: Colors.white),),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,// How long the Snackbar is displayed
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
          if(state is RegisterSuccessState){
            final snackbar = SnackBar(
              content: const Text('Successfully Registered',style: TextStyle(color: Colors.white),),
              duration: Duration(seconds: 2),
              backgroundColor: Colors.green,// How long the Snackbar is displayed
            );
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
            Future.delayed(const Duration(seconds: 1));
            Navigator.pop(context);
          }
        },
        builder: (context,state){
          return Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.medical_services,size: 60,color: Colors.blue.shade800,),
                    const SizedBox(height: 20,),
                    Text("REGISTER",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.blue.shade800),),
                    Divider(),
                    const SizedBox(height: 30,),
                    Form(
                      key: formGlobalKey,
                      child: Column(
                        children: [
                          InputTextField(controller: nameController,label: "Name",validator:(name)=>Validators.nameValidator(name),),
                          const SizedBox(height: 20,),
                          InputTextField(controller: phoneController,label: "Mobile Number",textInputType: TextInputType.phone,validator:(phone)=>Validators.phoneValidator(phone)),
                          const SizedBox(height: 20,),
                          InputTextField(controller: passwordController,label: "Password",isObscure:true,validator:(password)=>Validators.passwordValidator(password),),
                          const SizedBox(height: 20,),
                          BlocBuilder<RegisterBloc,RegisterState>(
                            builder: (context,state){
                              if(state is RegisterLoadingState){
                                return Center(child: CircularProgressIndicator(),);
                              }
                              return ElevatedButton(onPressed: (){
                                if(formGlobalKey.currentState!
                                    .validate()){
                                  RegisterModel registerModel=RegisterModel(name: nameController.text, phone: phoneController.text, password: passwordController.text);
                                  BlocProvider.of<RegisterBloc>(context).add(RegisterSubmittedEvent(registerModel: registerModel));
                                }
                                // RegisterRepository.register(registerModel.toJson());
                              }, child: Text("Register"),style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800),);
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
