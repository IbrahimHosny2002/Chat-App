import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  const CustomButton({super.key,required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
              ),
              child:  Center(
                child: Text(
                  buttonText,
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black
                  ),
                ),
              ),
            );
  }
}