import 'dart:convert';
import 'dart:ffi';
import 'package:assignment_intervel/utils/theme/theme.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/widget/common/custom_text.dart';
import '../../home/view/view.dart';

class AuthCubit extends Cubit {
  AuthCubit() : super(Void);
  void validateUser(
      {required userName, required password, required BuildContext context}) {
    if (userName.isEmpty && password.isEmpty) {
      snackBar(context, 'Field is required');
    } else if (userName.isEmpty && !password.isEmpty) {
      snackBar(context, 'Enter UserName');
    } else if (password.isEmpty && !userName.isEmpty) {
      snackBar(context, 'Enter UserName');
    } else if (userName != password) {
      snackBar(context, 'Invalid Account !');
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) =>  HomeScreen()));
    }
  }

  snackBar(context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 600),
        padding: EdgeInsets.all(20.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.r),
          ),
        ),
        backgroundColor: Colors.black,
        content: CustomText(
          text: text,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          size: 13.sp,
        ),
      ),
    );
  }
}
