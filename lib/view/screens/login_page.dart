import 'package:chat_app/view/screens/register_page.dart';
import 'package:chat_app/view/widgets/custo_text_field.dart';
import 'package:chat_app/view/widgets/customb_buttom.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static String id = 'LoginPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B475E),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/images/scholar.png",
              height: 100,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Scholar Chat',
                  style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30,
                      color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const Row(children: [
              Text(
                'Login',
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
            const CustoButtom(textButtom: 'Login'),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'don\'t have an account?',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterPage.id);
                  },
                  child: const Text(
                    '  Register',
                    style: TextStyle(fontSize: 15, color: Color(0XFFC7EDE6)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
