import 'package:easy_appointment/modules/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../auth/screens/auth.dart';
import 'package:easy_appointment/utils/constants/color_constants.dart';
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageConstants.welcome_logo,
                ),
                const Text(
                  "Book appointment hasslefree!",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1.0, 0.0), // Offset of the shadow
                        blurRadius: 3.0, // Spread or blur of the shadow
                        color: Colors.black, // Color of the shadow
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 2,
                      color: Colors.black,
                    )),
                    Text(
                      " Sign in to continue ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Expanded(
                        child: Container(
                      height: 2,
                      color: Colors.black,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context)=>AuthBloc(),
                              child: const AuthScreen(
                                    isDoctor: true,
                                  ),
                            )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        // Full radius (100%)
                        colors: [
                          Color(0xFF1FC575), // 100% at the center
                          Color(0xFF1FC575)
                              .withOpacity(0.6), // 52.6% at a certain point
                          Colors.white, // 0% at the outer edge
                        ],
                        stops: [0.0, 0.526, 1.0], // Corresponding stops
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "A Doctor",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Image.asset(ImageConstants.doctor_icon),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context)=>AuthBloc(),
                              child: const AuthScreen(
                                    isDoctor: false,
                                  ),
                            )));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        // Full radius (100%)
                        colors: [
                          Color(0xFF19BBC5), // 100% at the center
                          Color(0xFF1FB2BC)
                              .withOpacity(0.7), // 52.6% at a certain point
                          Colors.white, // 0% at the outer edge
                        ],
                        stops: [0.0, 0.526, 1.0], // Corresponding stops
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Text(
                              "A Patient",
                              style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Image.asset(ImageConstants.patient_icon),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: 2,
                      color: Colors.black,
                    )),
                    Text(
                      " or ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Expanded(
                        child: Container(
                      height: 2,
                      color: Colors.black,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Skip Login",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                )
              ],
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         Container(
    //           width: MediaQuery.of(context).size.width*0.8 +20,
    //           height: MediaQuery.of(context).size.height*0.32 +20,
    //           child: Stack(
    //             children: [
    //               Container(
    //                 width: MediaQuery.of(context).size.width*0.8,
    //                 height: MediaQuery.of(context).size.height*0.32,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(8),
    //                   color: Colors.blue.shade800,
    //                 ),
    //               ),
    //               Positioned(
    //                 top: 20,
    //                 left: 20,
    //                 child: GestureDetector(
    //                   onTap: (){
    //                     Get.to(const LoginScreen(),transition: Transition.rightToLeft,duration: const Duration(seconds: 1));
    //                     // Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
    //                   },
    //                   child: Container(
    //                   width: MediaQuery.of(context).size.width*0.8,
    //                   height: MediaQuery.of(context).size.height*0.32,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(8),
    //                       color: Colors.white,
    //                       border: Border.all(color: Colors.blue.shade800,width: 2)
    //                     ),
    //                     child: Center(
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           Image.asset(ImageConstants.patientLogo,width: 150,height: 150,),
    //                           SizedBox(height: 15,),
    //                           Text("PATIENT",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
    //                         ],
    //                       ),
    //                     ),
    //               ),
    //                 ),)
    //             ],
    //           ),
    //         ),
    //         Divider(thickness: 1.5,),
    //         Container(
    //           width: MediaQuery.of(context).size.width*0.8 +20,
    //           height: MediaQuery.of(context).size.height*0.32 +20,
    //           child: Stack(
    //             children: [
    //               Container(
    //                 width: MediaQuery.of(context).size.width*0.8,
    //                 height: MediaQuery.of(context).size.height*0.32,
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(8),
    //                   color: Colors.teal,
    //                 ),
    //               ),
    //               Positioned(
    //                 top: 20,
    //                 left: 20,
    //                 child: GestureDetector(
    //                   onTap: (){
    //                     Get.to(const DoctorLoginScreen(),transition: Transition.rightToLeft,duration: const Duration(seconds: 1));
    //                   },
    //                   child: Container(
    //                   width: MediaQuery.of(context).size.width*0.8,
    //                   height: MediaQuery.of(context).size.height*0.32,
    //                     decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(8),
    //                       color: Colors.white,
    //                       border: Border.all(color: Colors.teal,width: 2)
    //                     ),
    //                     child: Center(
    //                       child: Column(
    //                         mainAxisAlignment: MainAxisAlignment.center,
    //                         children: [
    //                           Image.asset(ImageConstants.doctorLogo,width: 150,height: 150,),
    //                           SizedBox(height: 15,),
    //                           Text("DOCTOR",style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold),),
    //                         ],
    //                       ),
    //                     ),
    //               ),
    //                 ),)
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
