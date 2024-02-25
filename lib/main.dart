import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/view/screens/chat_page.dart';
import 'package:chat_app/view/screens/login_page.dart';
import 'package:chat_app/view/screens/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

bool? isLoging;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLoging = false;
  } else {
    isLoging = true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        ChatPage.id: (context) => const ChatPage(),
      },
      initialRoute: isLoging==false?LoginPage.id:ChatPage.id,
    );
  }
}
