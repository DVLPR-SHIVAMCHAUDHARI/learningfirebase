import 'package:e_com/consts/coller_pallet.dart';
import 'package:e_com/consts/customtextfield.dart';
import 'package:e_com/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Sign In",
              style: TextStyle(
                  color: CollerPallet.primaryColor,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 46.h,
          ),
          customtextfield(
              icon1: Icons.person_outline, hint: "Email or User Name"),
          SizedBox(
            height: 40.h,
          ),
          customtextfield(
              obs: _isPass,
              hint: "Password",
              icon1: Icons.lock_outline,
              suffixicon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPass = !_isPass;
                    });
                  },
                  icon: _isPass
                      ? Icon(Icons.visibility_outlined)
                      : Icon(Icons.visibility_off_outlined))),
          SizedBox(
            height: 40.h,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password ?",
                  style: TextStyle(
                      color: CollerPallet.primaryColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
              )),
          SizedBox(
            height: 40.h,
          ),
          SizedBox(
            height: 50.h,
            width: double.infinity,
            child: FilledButton(
                onPressed: () {},
                child: Text(
                  "Sign in",
                  selectionColor: Colors.white,
                )),
          ),
          SizedBox(
            height: 100.h,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => signupScreen(),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have account ?",
                      style: TextStyle(
                        color: CollerPallet.primaryColor,
                        fontSize: 15.sp,
                      )),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        color: CollerPallet.primaryColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
