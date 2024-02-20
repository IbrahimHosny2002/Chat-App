import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool? isSecure;
  final Function(String?)? onChanged;
  const CustomTextField({this.isSecure,this.onChanged, required this.hintText, super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecure==null?false:true,
      validator: (data) {
        if (data!.isEmpty) {
          return "this field is required";
        }else{
          return null;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          ))),
    );
  }
}
