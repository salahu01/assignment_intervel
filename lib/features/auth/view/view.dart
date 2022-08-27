import 'dart:developer';

import 'package:assignment_intervel/features/auth/auth.dart';
import 'package:assignment_intervel/utils/theme/theme.dart';
import 'package:assignment_intervel/utils/widget/common/custom_text.dart';
import 'package:assignment_intervel/utils/widget/common/custom_text_field.dart';
import 'package:assignment_intervel/utils/widget/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class LoginScreen extends AppColors {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(
        builder: (context) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: light,
              body: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.1),
                      CustomText(
                          text: 'LogIn',
                          size: 30.sp,
                          fontWeight: FontWeight.w700),
                      SizedBox(height: size.height * 0.05),
                      CustomTextField(
                        width: size.width * 0.9,
                        controller: userNameController,
                      ),
                      SizedBox(height: size.height * 0.05),
                      CustomPassField(
                        width: size.width * 0.9,
                        controller: passwordController,
                      ),
                      SizedBox(height: size.height * 0.1),
                      CustomButton(
                        onTap: () {
                          context.read<AuthCubit>().validateUser(
                                userName: userNameController.text,
                                password: passwordController.text,
                                context: context,
                              );
                        },
                        dialog: 'LogIn',
                        icon: Icons.arrow_forward_ios,
                        width: size.width * 0.4,
                        height: size.height * 0.1,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
