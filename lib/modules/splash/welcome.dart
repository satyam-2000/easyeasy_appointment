import 'package:easy_appointment/modules/patient/login/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants/image_constants.dart';
import '../doctor/login/screens/doctor_login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple.shade50,
      appBar: AppBar(title: const Text("Easy Appointments"),centerTitle: true,backgroundColor: Colors.purple,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.8 +20,
              height: MediaQuery.of(context).size.height*0.32 +20,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue.shade800,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                      onTap: (){
                        Get.to(const LoginScreen(),transition: Transition.rightToLeft,duration: const Duration(seconds: 1));
                        // Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                      },
                      child: Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      height: MediaQuery.of(context).size.height*0.32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(color: Colors.blue.shade800,width: 2)
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageConstants.patientLogo,width: 150,height: 150,),
                              SizedBox(height: 15,),
                              Text("PATIENT",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                  ),
                    ),)
                ],
              ),
            ),
            Divider(thickness: 1.5,),
            Container(
              width: MediaQuery.of(context).size.width*0.8 +20,
              height: MediaQuery.of(context).size.height*0.32 +20,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.teal,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 20,
                    child: GestureDetector(
                      onTap: (){
                        Get.to(const DoctorLoginScreen(),transition: Transition.rightToLeft,duration: const Duration(seconds: 1));
                      },
                      child: Container(
                      width: MediaQuery.of(context).size.width*0.8,
                      height: MediaQuery.of(context).size.height*0.32,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                          border: Border.all(color: Colors.teal,width: 2)
                        ),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(ImageConstants.doctorLogo,width: 150,height: 150,),
                              SizedBox(height: 15,),
                              Text("DOCTOR",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                  ),
                    ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
