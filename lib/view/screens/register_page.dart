import 'package:chat_app/constants.dart';
import 'package:chat_app/view/widgets/custom_button.dart';
import 'package:chat_app/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static String id = 'RgisterPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 80,
                ),
                Image.asset('assets/images/scholar.png'),
                const Text(
                  'Scholar Chat',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                const SizedBox(
                  height: 80,
                ),
                const Row(
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomTextField(
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 8,
                ),
                const CustomTextField(
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 16,
                ),
                const CustomButton(buttonText: 'Register'),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'already have an account?',
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '  Login',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFFC7EDE6)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 120,
                ),
              ],
            ),
          ),
        ));
  }
}