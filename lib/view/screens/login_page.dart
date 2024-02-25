import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/view/screens/chat_page.dart';
import 'package:chat_app/view/screens/register_page.dart';
import 'package:chat_app/view/widgets/custo_text_field.dart';
import 'package:chat_app/view/widgets/customb_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? userName, email, password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  kLogo,
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
                CustomTextField(
                  onChanged: (data) {
                    userName = data;
                  },
                  hintText: 'Username',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  isSecure: true,
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 25,
                ),
                CustoButtom(
                  textButtom: 'Login',
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      try {
                        isLoading = true;
                        setState(() {});
                        await loginUser();
                        Navigator.pushReplacementNamed(context, ChatPage.id,arguments: userName);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          showSnackBar(context, 'user-not-found');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context, 'wrong-password');
                        }
                      } catch (e) {
                        showSnackBar(context, 'there is an error');
                      }
                    } else {}
                    isLoading = false;
                    setState(() {});
                  },
                ),
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
                        style:
                            TextStyle(fontSize: 15, color: Color(0XFFC7EDE6)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
