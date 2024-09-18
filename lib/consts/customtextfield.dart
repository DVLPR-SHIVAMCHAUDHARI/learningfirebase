import 'package:e_com/consts/coller_pallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bool isPass = false;

TextField customtextfield({
  icon1,
  Widget? suffixicon,
  hint,
  bool obs = false,
}) {
  return TextField(
    obscureText: obs,
    decoration: InputDecoration(
      suffixIcon: suffixicon,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: CollerPallet.primaryColor)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: CollerPallet.primaryColor)),
      prefixIcon: Icon(
        icon1,
        color: CollerPallet.primaryColor,
      ),
      hintText: hint,
    ),
  );
}
