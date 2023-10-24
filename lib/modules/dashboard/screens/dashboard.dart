import 'package:easy_appointment/modules/login/screens/login.dart';
import 'package:flutter/material.dart';

import '../../login/models/login_model.dart';

class DashboardScreen extends StatefulWidget {
  
  LoginResponseModel patientDetails;
  
  DashboardScreen({Key? key,required this.patientDetails}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal,title: const Text("Easy Appointments"),),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Welcome ${widget.patientDetails.name}",style: TextStyle(fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          GestureDetector(
              onTap: (){
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
              },
              child: Text("Logout"))
        ],
      ),),
    );
  }
  Widget SuccessDialog(BuildContext context){
    return Dialog(child: Container(
      width: MediaQuery.of(context).size.width*0.85,
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("CONGRATULATIONS",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize: 16),),
            const SizedBox(height: 3,),
            Text("Your Booking Is Confirmed",style: TextStyle(color: Colors.teal),),
            Divider(thickness: 2,),
            const SizedBox(height: 5,),
            Text("Your Token Number:",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.bold),),
            const SizedBox(height: 8,),
            Text("19",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
            Divider(),
            const SizedBox(height: 5,),
            ElevatedButton(onPressed: (){
              nameController.clear();
              phoneController.clear();
              Navigator.pop(context);
            }, child: Text("OK"),style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),)
          ],
        ),
      ),
    ),);
  }
}




