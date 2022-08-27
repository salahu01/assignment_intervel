import 'package:assignment_intervel/model/drink_model.dart';
import 'package:assignment_intervel/utils/theme/theme.dart';
import 'package:assignment_intervel/utils/widget/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends AppColors {
  const DetailsScreen({Key? key, required this.drinkModel}) : super(key: key);
  final DrinkModel drinkModel;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: light,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    drinkModel.strDrinkThumb!,
                    width: double.maxFinite,
                    errorBuilder: (context, error, stackTrace) => Center(
                      child: Icon(
                        Icons.error_outline,
                        size: 40.sp,
                      ),
                    ),
                  ),
                  CustomText(
                      text:
                          'Alcoholic : ${drinkModel.strAlcoholic ?? 'Couldn\'t find'}'),
                  CustomText(
                      text:
                          'Category : ${drinkModel.strCategory ?? 'Couldn\'t find'}'),
                  CustomText(
                      text:
                          'Glass : ${drinkModel.strGlass ?? 'Couldn\'t find'}'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.r),
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: SizedBox(
                    height: 50.h,
                    width: size.width * 0.8,
                    child: AppBar(
                      backgroundColor: light,
                      elevation: 0,
                      leading: InkWell(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        onTap: () => Navigator.pop(context),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: primary,
                          size: 25.sp,
                        ),
                      ),
                      title: CustomText(
                        text:drinkModel.strDrink ?? 'Couldn\'t find',
                          fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
