import 'package:e_com/consts/coller_pallet.dart';
import 'package:e_com/consts/customtextfield.dart';
import 'package:e_com/controllers/auth_controller.dart';
import 'package:e_com/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showSnackbar(message, {color = Colors.green}) {
  ScaffoldMessenger.of(appContext).showSnackBar(
    SnackBar(
      backgroundColor: color,
      content: Text(message),
    ),
  );
}

class signupScreen extends StatefulWidget {
  signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  TextEditingController nameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController passField = TextEditingController();
  TextEditingController confirmPassfield = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool ispassed = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Scaffold(
            body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back_ios,
                            color: CollerPallet.primaryColor, size: 20),
                        Text(
                          "Back",
                          style: TextStyle(
                              color: CollerPallet.primaryColor,
                              fontSize: 12.sp),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 104.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Sign Up",
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
                      required: true,
                      icon1: Icons.person_outline,
                      hint: "Full Name",
                      controller: nameField),
                  SizedBox(
                    height: 40.h,
                  ),
                  customtextfield(
                      required: true,
                      icon1: Icons.email_outlined,
                      hint: "Email",
                      controller: emailField),
                  SizedBox(
                    height: 40.h,
                  ),
                  customtextfield(
                      required: true,
                      controller: passField,
                      obs: true,
                      hint: "Password",
                      icon1: Icons.lock_outline,
                      suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              ispassed = !ispassed;
                            });
                          },
                          icon: ispassed
                              ? Icon(Icons.visibility_outlined)
                              : Icon(Icons.visibility_off_outlined))),
                  SizedBox(
                    height: 40.h,
                  ),
                  customtextfield(
                      required: true,
                      controller: confirmPassfield,
                      obs: true,
                      hint: "Confirm Password",
                      icon1: Icons.lock_outline,
                      suffixicon: IconButton(
                          onPressed: () {
                            setState(() {
                              ispassed = !ispassed;
                            });
                          },
                          icon: ispassed
                              ? Icon(Icons.visibility_outlined)
                              : Icon(Icons.visibility_off_outlined))),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: FilledButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (confirmPassfield.text == passField.text) {
                              AuthController().signUp(
                                  name: nameField.text,
                                  email: emailField.text,
                                  password: passField.text);
                            } else {
                              showSnackbar(
                                  color: Colors.red,
                                  "Confirm password and password not matched");
                            }
                          }
                        },
                        child: Text(
                          "Sign Up",
                          selectionColor: Colors.white,
                        )),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signupScreen(),
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account ?",
                            style: TextStyle(
                              color: CollerPallet.primaryColor,
                              fontSize: 15.sp,
                            )),
                        Text(
                          "Sign In",
                          style: TextStyle(
                              color: CollerPallet.primaryColor,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )),
        Positioned(
          right: -28.w,
          top: -88.h,
          child: Container(
            clipBehavior: Clip.none,
            width: 128.w,
            height: 128.h,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xff471AA0)),
          ),
        ),
        Positioned(
          right: -83.w,
          top: -47.h,
          child: Container(
            clipBehavior: Clip.none,
            width: 142.w,
            height: 142.h,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffBB84E8)),
          ),
        ),
      ],
    );
  }
}
