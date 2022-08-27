import 'package:assignment_intervel/features/details/details.dart';
import 'package:assignment_intervel/features/home/cubit/cubit.dart';
import 'package:assignment_intervel/features/search/view/view.dart';
import 'package:assignment_intervel/services/get_drinks.dart';
import 'package:assignment_intervel/utils/theme/theme.dart';
import 'package:assignment_intervel/utils/widget/common/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends AppColors {
   HomeScreen({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: light,
        appBar: AppBar(
          backgroundColor: light,
          elevation: 0,
          leadingWidth: 0,
          toolbarHeight: 110.h,
          title: Column(
            children: [
              CustomText(
                text: 'Popular Rums',
                size: 25.sp,
                fontWeight: FontWeight.w900,
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Flexible(
                    child: SizedBox(
                      height: 45.h,
                      child: TextField(
                        cursorColor: primary,
                        cursorHeight: 20.sp,
                        style: TextStyle(
                          letterSpacing: 0.4.sp,
                          color: primary,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: lowLight,
                          contentPadding: EdgeInsets.only(left: 15.w),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.sp),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(controller: controller),
                      ),
                    ),
                    color: lowLight,
                    icon: Icon(
                      Icons.search,
                      color: primary,
                      size: 33.sp,
                    ),
                  ),
                  SizedBox(width: 10.w)
                ],
              )
            ],
          ),
        ),
        body: BlocProvider(
          create: (context) => HomeCubit(getDrinks: GetDrinks()),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ErrorState) {
                return const Center(
                   child: CustomText(text: 'Something Went Wrong !!!'),
                );
              } else if (state is LoadedState) {
                final drinks = state.drinks;

                return ListView.builder(
                  itemCount: drinks.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          drinkModel: drinks[index],
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(15.r),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.r),
                            child: Image.network(
                              drinks[index].strDrinkThumb!,
                              fit: BoxFit.cover,
                              height: 125.sp,
                              width: 125.sp,
                            ),
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text:
                                    drinks[index].strDrink ?? 'Couldn\'t find',
                                fontWeight: FontWeight.w800,
                              ),
                              SizedBox(height: 30.h),
                              CustomText(
                                text: drinks[index].strCategory ??
                                    'Couldn\'t find',
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
