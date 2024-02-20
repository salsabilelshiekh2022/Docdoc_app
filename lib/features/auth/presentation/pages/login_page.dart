import 'package:doc_app/features/auth/presentation/widgets/title_and_subtitle.dart';
import 'package:doc_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                  title: S.of(context).welcome_back,
                  subtitle: S.of(context).login_subtitle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
