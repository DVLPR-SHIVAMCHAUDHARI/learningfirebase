import 'package:e_com/controllers/auth_controller.dart';
import 'package:e_com/firebase_options.dart';
import 'package:e_com/views/home_screen.dart';
import 'package:e_com/views/sign_in.dart';
import 'package:e_com/views/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';

final navigatorKey = GlobalKey<NavigatorState>();
BuildContext get appContext => navigatorKey.currentState!.context;
Logger logger = Logger();

enum Routes { signin, signup, homescreen }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(e_com());
}

class e_com extends StatelessWidget {
  e_com({super.key});

  GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: Routes.signin.name,
        builder: (context, state) =>
            AuthController().isLogin ? HomeScreen() : SignIn(),
        routes: [
          GoRoute(
            path: 'signup',
            name: Routes.signup.name,
            builder: (context, state) => signupScreen(),
          )
        ],
      ),
      GoRoute(
        path: '/home',
        name: Routes.homescreen.name,
        builder: (context, state) => HomeScreen(),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
      ),
    );
  }
}
