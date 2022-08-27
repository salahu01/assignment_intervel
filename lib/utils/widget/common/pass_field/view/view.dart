import 'package:assignment_intervel/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets.dart';

class CustomPassField extends AppColors {
  const CustomPassField(
      {Key? key, required this.width, required this.controller})
      : super(key: key);
  final double width;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthPassCubit(),
      child: Builder(
        builder: (context) => SizedBox(
          width: width,
          child: TextFormField(
            obscureText: context.select((AuthPassCubit cubit) => cubit.state),
            controller: controller,
            decoration: InputDecoration(
              suffix: InkWell(
                onTap: () => context.read<AuthPassCubit>().changeShow(),
                child: Icon(
                  context.select((AuthPassCubit cubit) => cubit.state) == true
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: primary,
                ),
              ),
              labelText: 'Password',
              contentPadding: EdgeInsets.only(left: 10.r, right: 10.r),
              enabled: true,
              alignLabelWithHint: true,
              border: inputBorder(),
              disabledBorder: inputBorder(),
              errorBorder: inputBorder(color: Colors.red),
              focusedBorder: inputBorder(),
            ),
            validator: (val) {
              if (val == null || val.isEmpty) {
                return 'Enter your Password';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  InputBorder inputBorder({double? radius, Color? color, double? width}) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius ?? 10.r),
        borderSide: BorderSide(color: color ?? primary, width: width ?? 1.sp),
      );
}
