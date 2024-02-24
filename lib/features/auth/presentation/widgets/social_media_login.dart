import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_assets.dart';
import 'social_media_button.dart';

class SocialMediaLogin extends StatelessWidget {
  const SocialMediaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 86.w),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SocialMediaButton(
            icon: AppAssets.googleIcon,
          ),
          SocialMediaButton(
            icon: AppAssets.facebookIcon,
          ),
          SocialMediaButton(
            icon: AppAssets.appleIcon,
          ),
        ],
      ),
    );
  }
}
