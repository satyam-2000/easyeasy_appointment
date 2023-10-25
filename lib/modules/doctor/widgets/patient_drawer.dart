import 'package:easy_appointment/modules/patient/login/models/login_model.dart';
import 'package:flutter/material.dart';

import '../../patient/login/screens/login.dart';

class PatientDrawer extends StatefulWidget {
  final LoginResponseModel patientDetails;
  const PatientDrawer({Key? key,required this.patientDetails}) : super(key: key);

  @override
  State<PatientDrawer> createState() => _PatientDrawerState();
}

class _PatientDrawerState extends State<PatientDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hello",),
            const SizedBox(height: 10,),
            Text(widget.patientDetails.name,style: const TextStyle(fontWeight: FontWeight.bold),),
          ],
        ),backgroundColor: Colors.blue.shade800,
      toolbarHeight: MediaQuery.of(context).size.height*0.15,
      automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                ListTile(title: Row(
                  children: [
                    Icon(Icons.badge_rounded,color: Colors.black,),
                    const SizedBox(width: 10,),
                    Text("My Appointments"),
                  ],
                ),),
                Divider(),
                const SizedBox(height: 10,),
                ListTile(title: Row(
                  children: [
                    Icon(Icons.balcony_sharp,color: Colors.black,),
                    const SizedBox(width: 10,),
                    Text("Book Appointment"),
                  ],
                ),),
                Divider(),
                const SizedBox(height: 10,),
                ListTile(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>const LoginScreen()), (route) => false);
                  },
                  title: Row(
                  children: [
                    Icon(Icons.logout,color: Colors.black,),
                    const SizedBox(width: 10,),
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
}
