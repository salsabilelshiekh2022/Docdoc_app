import 'package:doc_app/core/di/dependency_injection.dart';
import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/utils/extention.dart';
import 'package:doc_app/core/utils/spacing.dart';
import 'package:doc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doc_app/features/auth/presentation/widgets/login_form.dart';
import 'package:doc_app/features/auth/presentation/widgets/title_and_subtitle.dart';
import 'package:doc_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/snack_bar.dart';
import '../widgets/have_account.dart';
import '../widgets/or_sign_with.dart';
import '../widgets/social_media_login.dart';
import '../widgets/terms_and_conditions_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<AuthBloc>(),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.pushReplacementNamed(Routes.navBar);
            } else if (state is LoginError) {
              showSnackBar(
                  'This email doesn\'t match of any users try to Register and then try again',
                  AppColors.red);
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
                      title: S.of(context).welcome_back,
                      subtitle: S.of(context).login_subtitle,
                    ),
                    verticalSpace(36),
                    const LoginForm(),
                    verticalSpace(45),
                    const OrSignWith(),
                    verticalSpace(32),
                    const SocialMediaLogin(),
                    verticalSpace(32),
                    const TermsAndConditionsText(),
                    verticalSpace(24),
                    HaveAccountText(
                      haveAccount: S.of(context).not_have_account,
                      signinOrSignUp: S.of(context).sign_up,
                      onPressed: () {
                        context.pushReplacementNamed(Routes.signUpPage);
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
