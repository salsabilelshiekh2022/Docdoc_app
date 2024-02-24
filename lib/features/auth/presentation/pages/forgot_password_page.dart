import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';
import '../widgets/forgot_password_form.dart';
import '../widgets/title_and_subtitle.dart';

class ForgotPasswordpage extends StatelessWidget {
  const ForgotPasswordpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(left: 24.w, right: 24.w, top: 50.h, bottom: 24.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleAndSubtitle(
                  title: S.of(context).forgot_password,
                  subtitle: S.of(context).forget_password_subtitle,
                ),
                verticalSpace(36),
                const ForgotPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
