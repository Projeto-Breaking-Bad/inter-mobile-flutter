import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:caca_talentos/pages/login.page.dart';
import 'package:caca_talentos/pages/reset-password.page.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caça Talentos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 17, 16, 20)),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}