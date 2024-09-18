import 'package:e_com/firebase_options.dart';
import 'package:e_com/views/sign_in.dart';
import 'package:e_com/views/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(e_com());
}

class e_com extends StatelessWidget {
  const e_com({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(430, 932),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SignIn(),
            ));
  }
}
