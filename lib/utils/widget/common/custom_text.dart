import 'package:assignment_intervel/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends AppColors {
  const CustomText(
      {Key? key, required this.text, this.color, this.fontWeight, this.size})
      : super(key: key);
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? primary,
        fontSize: size ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
    );
  }
}
