import 'package:chat_app/view/screens/login_page.dart';
import 'package:chat_app/view/screens/register_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginPage.id: (context) => LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
      },
      initialRoute: LoginPage.id,
      home: LoginPage(),
    );
  }
}
