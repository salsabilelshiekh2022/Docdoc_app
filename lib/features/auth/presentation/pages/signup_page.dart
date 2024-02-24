import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/utils/extention.dart';
import 'package:doc_app/core/utils/spacing.dart';
import 'package:doc_app/features/auth/presentation/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/snack_bar.dart';
import '../../../../generated/l10n.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/have_account.dart';
import '../widgets/or_sign_with.dart';
import '../widgets/social_media_login.dart';
import '../widgets/terms_and_conditions_text.dart';
import '../widgets/title_and_subtitle.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              context.pushReplacementNamed(Routes.loginPage);
            } else if (state is RegisterError) {
              showSnackBar(
                  'The email or phone has been used before', AppColors.red);
            }
          },
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 24.w, right: 24.w, top: 50.h, bottom: 24.h),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndSubtitle(
                      title: S.of(context).create_account,
                      subtitle: S.of(context).sign_up_subtitle,
                    ),
                    verticalSpace(36),
                    const SignupForm(),
                    verticalSpace(45),
                    const OrSignWith(),
                    verticalSpace(32),
                    const SocialMediaLogin(),
                    verticalSpace(32),
                    const TermsAndConditionsText(),
                    verticalSpace(24),
                    HaveAccountText(
                      haveAccount: S.of(context).already_have_account,
                      signinOrSignUp: S.of(context).sign_in,
                      onPressed: () {
                        context.pushReplacementNamed(Routes.loginPage);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
