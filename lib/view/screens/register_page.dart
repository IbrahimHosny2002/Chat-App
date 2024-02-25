import 'package:chat_app/constants.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/view/screens/chat_page.dart';
import 'package:chat_app/view/widgets/custo_text_field.dart';
import 'package:chat_app/view/widgets/customb_buttom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String id = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String?userName, email, password;

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
                    'Register',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ]),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: (date) {
                    userName = date;
                  },
                  hintText: 'Username',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onChanged: (date) {
                    email = date;
                  },
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  isSecure: true,
                  onChanged: (date) {
                    password = date;
                  },
                  hintText: 'Password',
                ),
                const SizedBox(
                  height: 25,
                ),
                CustoButtom(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          isLoading = true;
                          setState(() {});
                          await registerUser();
                          Navigator.pushReplacementNamed(context, ChatPage.id,arguments: userName);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            showSnackBar(context, 'weak-password');
                          } else if (e.code == 'email-already-in-use') {
                            showSnackBar(context, 'email-already-in-use');
                          }
                        } catch (e) {
                          showSnackBar(context, 'there is an error');
                        }
                      } else {}
                      isLoading = false;
                      setState(() {});
                    },
                    textButtom: 'Register'),
                const SizedBox(
                  height: 10,
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
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        '  Login',
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

  Future<void> registerUser() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
