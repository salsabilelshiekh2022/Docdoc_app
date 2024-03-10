import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';

class RecommendationDoctorItem extends StatelessWidget {
  const RecommendationDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.r),
      width: double.infinity,
      height: 126.h,
      color: Colors.white,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              AppAssets.homeDoctor,
              width: 110.w,
              height: 110.h,
              fit: BoxFit.fill,
            ),
          ),
          horizontalSpace(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).doctor_name,
                style: AppTextStyle.font16Gray24Weight700,
              ),
              verticalSpace(8),
              Text(
                '${S.of(context).general} | ${S.of(context).rsud}',
                style: AppTextStyle.font12Gray70Weight400
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              verticalSpace(12),
              Row(
                children: [
                  const Icon(Icons.star_rounded,
                      color: AppColors.yellow, size: 13),
                  horizontalSpace(3),
                  Text(
                    '4.8 (4,279 ${S.of(context).reviews})',
                    style: AppTextStyle.font12Gray70Weight400
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
