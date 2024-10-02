import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/core/widgets/search_bar_with_cart.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce/features/home/presentation/widgets/announcments_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/brands_section.dart';
import 'package:ecommerce/features/home/presentation/widgets/categories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  const HomeTab();

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final _homeCubit = serviceLocator.get<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _homeCubit.getBrands();
    _homeCubit.getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: 17.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              SizedBox(height: 18.h),
              const SearchBarWithCart(),
              SizedBox(height: 16.h),
              const AnnouncementsSection(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorsManager.darkPrimaryColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ColorsManager.darkPrimaryColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              CategoriesSection(),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Brands',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: ColorsManager.darkPrimaryColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'View All',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: ColorsManager.darkPrimaryColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              BrandsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
