import 'package:doc_app/core/theme/app_text_styles.dart';
import 'package:doc_app/core/utils/app_assets.dart';
import 'package:doc_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(AppAssets.docdocLogoLowOpacity),
        Container(
          child: Image.asset(AppAssets.onboardingDoctor),
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.0),
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.14, 0.4])),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 30.h,
          child: Text(
            S.of(context).best_doctor,
            textAlign: TextAlign.center,
            style: AppTextStyle.font32MainBlueWeight700.copyWith(
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
