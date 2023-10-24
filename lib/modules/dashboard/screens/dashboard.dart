import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text("CURRENT TOKEN : 07",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.teal),),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Patient Name:",style: TextStyle(color: Colors.teal,fontSize: 15),),
                  const SizedBox(height: 8,),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.teal,
                      focusColor: Colors.teal,
                      hintText: "Enter",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Text("Mobile Number:",style: TextStyle(color: Colors.teal,fontSize: 15),),
                  const SizedBox(height: 8,),
                  TextFormField(
                     controller: phoneController,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    decoration: InputDecoration(
                      fillColor: Colors.teal,
                      focusColor: Colors.teal,
                      hintText: "Enter",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40,),
                  Center(child: ElevatedButton(onPressed: (){
                    showDialog(context: context, builder: (context)=>SuccessDialog(context));
                  }, child: const Text("Book Appointment"),style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),))
                ],
              ),
            ),
          ],
        ),
      ),
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




