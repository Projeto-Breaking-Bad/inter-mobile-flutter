import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerWithEmailAndPassword(String email, String senha) async {
    WidgetsFlutterBinding.ensureInitialized();
    final user = _auth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String senha) async {
    WidgetsFlutterBinding.ensureInitialized();
    final user = _auth.signInWithEmailAndPassword(
      email: email,
      password: senha,
    );
  }
}