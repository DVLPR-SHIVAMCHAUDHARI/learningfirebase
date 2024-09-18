import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/main.dart';
import 'package:e_com/views/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthController extends ChangeNotifier {
  static AuthController instance = AuthController.internal();
  AuthController.internal();
  factory AuthController() => instance;

  get uid => FirebaseAuth.instance.currentUser!.uid;
  get name => FirebaseAuth.instance.currentUser!.displayName;
  get email => FirebaseAuth.instance.currentUser!.email;
  get isLogin => FirebaseAuth.instance.currentUser != null;

  signIn({email, password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      GoRouter.of(appContext).goNamed(Routes.homescreen.name);
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      if (e.code == "invalid-credential") {
        showSnackbar("Invalid Credentials", color: Colors.red);
      }
    }
  }

  signUp({name, email, password}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await storeUserData(email: email, password: password, name: name);
      GoRouter.of(appContext).goNamed(Routes.homescreen.name);
    } on FirebaseAuthException catch (e) {
      logger.e(e.code);
      if (e.code == "email-already-in-use") {
        showSnackbar("This email is alredy exists", color: Colors.red);
      }
    }
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    GoRouter.of(appContext).goNamed(Routes.signin.name);
  }

  storeUserData({email, name, password}) {
    FirebaseFirestore.instance.collection('users').doc(uid).set({
      "name": name,
      "email": email,
      "password": password,
      "created_at": DateTime.now().toString()
    });
  }
}
