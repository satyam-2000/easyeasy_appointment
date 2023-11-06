import 'package:easy_appointment/modules/patient/login/models/login_model.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/color_constants.dart';
import '../../splash/welcome.dart';

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
                    showPopup(context);
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

  void showPopup(BuildContext context) {
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
                          }, child: Text("Yes"),style: ElevatedButton.styleFrom(backgroundColor: AppColors.patientThemeColor),),
                          ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: Text("No",),
                              style: ElevatedButton.styleFrom(backgroundColor: AppColors.patientThemeColor
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
