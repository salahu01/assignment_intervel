import 'package:assignment_intervel/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends AppColors {
  const CustomButton(
      {Key? key,
      required this.onTap,
      required this.dialog,
      required this.icon,
      required this.width,
      required this.height})
      : super(key: key);
  final VoidCallback onTap;
  final double width;
  final double height;
  final String dialog;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(20.sp),
        ),
        child: SizedBox(
          width: width,
          height: height,
          child: Row(
            children: [
              const Spacer(flex: 2),
              Text(
                dialog,
                style: TextStyle(
                    color: light, fontWeight: FontWeight.w700, fontSize: 23.sp),
              ),
              const Spacer(),
              Icon(
                icon,
                color: light,
                size: 25.sp,
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
