import 'package:doc_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppTextStyle {
  static TextStyle font24Gray24Weight700 = TextStyle(
    fontSize: 24.sp,
    color: AppColors.gray24,
    fontWeight: FontWeight.w700,
  );
  static TextStyle font24MainBlueWeight700 = TextStyle(
    fontSize: 24.sp,
    color: AppColors.mainBlue,
    fontWeight: FontWeight.w700,
  );
  static TextStyle font32MainBlueWeight700 = TextStyle(
    fontSize: 32.sp,
    color: AppColors.mainBlue,
    fontWeight: FontWeight.w700,
  );
  static TextStyle font12Gray70Weight400 = TextStyle(
    fontSize: 12.sp,
    color: AppColors.gray70,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font14Gray70Weight400 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.gray70,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font16WhiteWeight600 = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w700,
  );
}
