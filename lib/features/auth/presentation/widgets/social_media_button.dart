import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/app_colors.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({super.key, required this.icon});
  final String icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 46.w,
        height: 46.h,
        decoration: BoxDecoration(
          color: AppColors.gray20,
          borderRadius: BorderRadius.circular(23),
        ),
        child: Center(
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
