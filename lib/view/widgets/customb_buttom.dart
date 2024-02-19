import 'package:flutter/material.dart';

class CustoButtom extends StatelessWidget {
  final String textButtom;
  final VoidCallback? onTap;
  const CustoButtom({this.onTap, required this.textButtom, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            textButtom,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
