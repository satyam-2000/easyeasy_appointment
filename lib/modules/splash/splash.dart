import 'package:easy_appointment/modules/splash/welcome.dart';
import 'package:flutter/material.dart';

import '../dashboard/screens/dashboard.dart';
import '../login/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.medical_services,size: 60,color: Colors.white,),
          const SizedBox(height: 20,),
          Text("EASY APPOINTMENTS",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
        ],
      ),),
    );
  }
}
