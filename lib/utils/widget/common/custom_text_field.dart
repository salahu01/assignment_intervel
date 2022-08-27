import 'package:assignment_intervel/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends AppColors {
  const CustomTextField({Key? key,required this.width,required this.controller}) : super(key: key);
  final double width;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                  width: width,
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      contentPadding: EdgeInsets.only(
                        left: 10.r,
                      ),
                      enabled: true,
                      alignLabelWithHint: true,
                      border: inputBorder(),
                      disabledBorder: inputBorder(),
                      errorBorder: inputBorder(color: Colors.red),
                      focusedBorder: inputBorder(),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Enter your Username';
                      }
                      return null;
                    },
                  ),
                );
  }
    InputBorder inputBorder({double? radius, Color? color, double? width}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10.r),
        borderSide: BorderSide(color: color ?? primary, width: width ?? 1.sp),
      );
}