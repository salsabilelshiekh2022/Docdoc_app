import 'package:doc_app/core/theme/app_text_styles.dart';
import 'package:doc_app/core/utils/spacing.dart';
import 'package:doc_app/features/onboarding/presentation/widgets/doc_logo_and_name.dart';
import 'package:doc_app/features/onboarding/presentation/widgets/doctor_image_and_text.dart';
import 'package:doc_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/get_started_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
            child: Column(
              children: [
                const DocLogoAndName(),
                verticalSpace(40),
                const DoctorImageAndText(),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                  child: Column(
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        S.of(context).onboareding_subtitile,
                        style: AppTextStyle.font12Gray70Weight400,
                      ),
                      verticalSpace(32),
                      const GetStartedButton()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
