import 'package:easy_appointment/modules/splash/welcome.dart';
import 'package:easy_appointment/utils/constants/color_constants.dart';
import 'package:flutter/material.dart';

import '../login/model/login_model.dart';
import '../login/screens/doctor_login_screen.dart';

class DoctorDrawer extends StatefulWidget {
  final DoctorLoginResponseModel doctorDetails;
  const DoctorDrawer({Key? key,required this.doctorDetails}) : super(key: key);

  @override
  State<DoctorDrawer> createState() => _DoctorDrawerState();
}

class _DoctorDrawerState extends State<DoctorDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Hello",),
              const SizedBox(height: 10,),
              Text("Dr. ${widget.doctorDetails.name}",style: const TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),backgroundColor: AppColors.doctorThemeColor,
          toolbarHeight: MediaQuery.of(context).size.height*0.15,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const ListTile(title: Row(
                    children: [
                      Icon(Icons.badge_rounded,color: Colors.black,),
                      SizedBox(width: 10,),
                      Text("Upcoming Appointments"),
                    ],
                  ),),
                  const Divider(),
                  const SizedBox(height: 10,),
                  const ListTile(title: Row(
                    children: [
                      Icon(Icons.balcony_sharp,color: Colors.black,),
                      SizedBox(width: 10,),
                      Text("Previous Appointments"),
                    ],
                  ),),
                  const Divider(),
                  const SizedBox(height: 10,),
                  const ListTile(title: Row(
                    children: [
                      Icon(Icons.person,color: Colors.black,),
                      const SizedBox(width: 10,),
                      Text("My Profile"),
                    ],
                  ),),
                  Divider(),
                  const SizedBox(height: 10,),
                  ListTile(
                    onTap: (){
                      showPopUP(context);
                    },
                    title: const Row(
                      children: [
                        Icon(Icons.logout,color: Colors.black,),
                        SizedBox(width: 10,),
                        Text("Logout"),
                      ],
                    ),),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("About the App",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,decoration: TextDecoration.underline),),
              )
            ],
          ),
        ),
      ),
    );
  }

  showPopUP(BuildContext context) {
    showDialog(context: context, builder: (context){
      return Center(
        child: Dialog(
          child: Container(
            width: 150,
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Are you sure?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 20,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed: (){
                          Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const WelcomeScreen()), (route) => false);
                        }, child: Text("Yes"),style: ElevatedButton.styleFrom(backgroundColor: AppColors.doctorThemeColor),),
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("No",),
                            style: ElevatedButton.styleFrom(backgroundColor: AppColors.doctorThemeColor
                            ) ),
                      ]
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
