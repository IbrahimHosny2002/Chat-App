import 'package:chat_app/view/widgets/custo_text_field.dart';
import 'package:chat_app/view/widgets/customb_buttom.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B475E),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal:10
        ),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(
              flex: 2,
            ),
            Image.asset("assets/images/scholar.png"),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                  fontFamily: 'Pacifico', fontSize: 30, color: Colors.white),
            ),
            const Spacer(
              flex: 1,
            ),
            const Row(children: [
              Text(
                'Sign in',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ]),
            const SizedBox(
              height: 20,
            ),
            const CustomTextField(
              hintText: 'Email',
            ),
            const SizedBox(
              height: 10,
            ),
            const CustomTextField(
              hintText: 'Password',
            ),
            const SizedBox(
              height: 25,
            ),
            const CustoButtom(textButtom: 'Sign in'),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'don\'t have an account',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                Text(
                  '  Sign Up',
                  style: TextStyle(fontSize: 15, color: Color(0XFFC7EDE6)),
                ),
              ],
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
