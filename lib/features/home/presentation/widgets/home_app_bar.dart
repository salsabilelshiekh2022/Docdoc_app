import 'package:doc_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${S.of(context).hi}, Omar!',
              style: AppTextStyle.font18Gray24Weight700,
            ),
            verticalSpace(2),
            Text(
              S.of(context).how_are_you,
              style: AppTextStyle.font11Gray80Weight400,
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: AppColors.gray20,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Center(
              child: SvgPicture.asset(AppAssets.notificationIcon),
            ),
          ),
        )
      ],
    );
  }
}
