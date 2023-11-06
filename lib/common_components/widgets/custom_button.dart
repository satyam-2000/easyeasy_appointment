import 'package:flutter/material.dart';

import '../../utils/constants/color_constants.dart';

class CustomButton extends StatefulWidget {
  String text;
  Color color;
  CustomButton({Key? key,required this.text,required this.color}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(width: MediaQuery.of(context).size.width,height: 55,child: Center(child: Text(widget.text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: widget.color),
    );
  }
}
