import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 28.h),
            height: 167.h,
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 18.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: AppColors.mainBlue,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 143.w,
                  child: Text(
                    S.of(context).book_and_schedule,
                    style: AppTextStyle.font18WhiteWeight500,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                verticalSpace(15),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 109.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(48.r),
                        color: Colors.white),
                    child: Center(
                      child: Text(S.of(context).find_nearby,
                          style: AppTextStyle.font12MainBlueWeight400),
                    ),
                  ),
                ),
              ],
            )),
        PositionedDirectional(
          bottom: 0,
          end: 0,
          child: Image.asset(
            AppAssets.femaleDoctor,
            width: 136.w,
            height: 197.h,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}
