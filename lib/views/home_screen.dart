import 'package:e_com/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FilledButton(
              onPressed: () {
                AuthController().signOut();
              },
              child: Text("Sign Out")),
        ),
      ),
    );
  }
}
