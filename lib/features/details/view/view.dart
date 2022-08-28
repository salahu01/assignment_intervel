import 'package:assignment_intervel/model/drink_model.dart';
import 'package:assignment_intervel/utils/theme/theme.dart';
import 'package:assignment_intervel/utils/widget/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsScreen extends AppColors {
  const DetailsScreen({Key? key, required this.drinkModel, required this.index})
      : super(key: key);
  final DrinkModel drinkModel;
  final int index;

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
                  Stack(
                    children: [
                      Hero(
                        tag: 'image$index',
                        child: Image.network(
                          drinkModel.strDrinkThumb!,
                          width: double.maxFinite,
                          errorBuilder: (context, error, stackTrace) => Center(
                            child: Icon(
                              Icons.error_outline,
                              size: 40.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(top: size.height * 0.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r),
                          ),
                          color: light,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Padding(
                              padding: EdgeInsets.all(5.r),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: ColoredBox(
                                    color: primary,
                                    child: SizedBox(
                                      height: 50.h,
                                      width: size.width * 0.8,
                                      child: Center(
                                        child: CustomText(
                                          text: drinkModel.strGlass ??
                                              'Couldn\'t find',
                                          fontWeight: FontWeight.w800,
                                          color: light,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(
                                  Icons.warning,
                                  color: Colors.red,
                                  size: 30.sp,
                                ),
                                CustomText(
                                  text:
                                      'It\'s an ${drinkModel.strAlcoholic} product  ',
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Align(
                              alignment: Alignment.topCenter,
                              child: CustomText(
                                text:
                                    'Category : ${drinkModel.strCategory ?? 'Couldn\'t find'}',
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Align(
                              alignment: Alignment.topCenter,
                              child: CustomText(
                                text: 'Ingredient',
                                fontWeight: FontWeight.w900,
                                size: 35.sp,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            incredient(drinkModel.strIngredient1,
                                drinkModel.strMeasure1),
                            incredient(drinkModel.strIngredient2,
                                drinkModel.strMeasure2),
                            incredient(drinkModel.strIngredient3,
                                drinkModel.strMeasure3),
                            incredient(drinkModel.strIngredient4,
                                drinkModel.strMeasure4),
                            incredient(drinkModel.strIngredient5,
                                drinkModel.strMeasure5),
                            incredient(drinkModel.strIngredient6,
                                drinkModel.strMeasure6),
                            incredient(drinkModel.strIngredient7,
                                drinkModel.strMeasure7),
                            incredient(drinkModel.strIngredient8,
                                drinkModel.strMeasure8),
                            incredient(drinkModel.strIngredient9,
                                drinkModel.strMeasure9),
                            incredient(drinkModel.strIngredient10,
                                drinkModel.strMeasure10),
                            incredient(drinkModel.strIngredient11,
                                drinkModel.strMeasure11),
                            incredient(drinkModel.strIngredient12,
                                drinkModel.strMeasure12),
                            incredient(drinkModel.strIngredient13,
                                drinkModel.strMeasure13),
                            incredient(drinkModel.strIngredient14,
                                drinkModel.strMeasure14),
                            incredient(drinkModel.strIngredient15,
                                drinkModel.strMeasure15),
                          ],
                        ),
                      )
                    ],
                  ),
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
                        text: drinkModel.strDrink ?? 'Couldn\'t find',
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

  Widget incredient(String? incredient, String? measur) => Visibility(
        visible: incredient == null ? false : true,
        child: Padding(
          padding: EdgeInsets.all(10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: incredient ?? '',
              ),
              CustomText(
                text: measur ?? '',
              ),
            ],
          ),
        ),
      );
}
