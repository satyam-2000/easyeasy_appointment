import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool? isObscure;
  TextInputType? textInputType;
  final String? Function(String?)? validator;
  InputTextField({Key? key,required this.controller,required this.label,this.isObscure,this.textInputType,this.validator,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label:",style: TextStyle(color: Colors.blue.shade800,fontSize: 15),),
        const SizedBox(height: 8,),
        TextFormField(
          validator: validator,
          keyboardType: textInputType??TextInputType.text,
          obscureText: isObscure??false,
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.blue.shade800,
            focusColor: Colors.blue.shade800,
            hintText: "Enter",
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.blue.shade800),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.blue.shade800),
            ),
          ),
        ),
      ],
    );
  }
}
