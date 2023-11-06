import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  TextEditingController controller;
  String label;
  bool? isObscure;
  TextInputType? textInputType;
  final String? Function(String?)? validator;
  Color themeColor;
  InputTextField({Key? key,required this.controller,required this.label,this.isObscure,this.textInputType,this.validator,required this.themeColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$label:",style: TextStyle(color: themeColor,fontSize: 15),),
        const SizedBox(height: 8,),
        TextFormField(
          validator: validator,
          keyboardType: textInputType??TextInputType.text,
          obscureText: isObscure??false,
          controller: controller,
          decoration: InputDecoration(
            fillColor: themeColor,
            focusColor: themeColor,
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: themeColor),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.red),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: themeColor),
            ),
          ),
        ),
      ],
    );
  }
}


class InputTextField2 extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  bool? isObscure;
  TextInputType? textInputType;
  final String? Function(String?)? validator;
  InputTextField2({Key? key,required this.controller,this.isObscure,this.textInputType,this.validator,required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText:isObscure??false,
      keyboardType: textInputType,
      validator: validator,
      decoration: InputDecoration(
        fillColor: const Color(0xFFefefef),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}

