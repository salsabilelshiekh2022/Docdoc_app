import 'package:doc_app/core/theme/app_colors.dart';
import 'package:doc_app/core/theme/app_text_styles.dart';
import 'package:doc_app/core/utils/spacing.dart';
import 'package:doc_app/core/widgets/app_text_form_field.dart';
import 'package:doc_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        AppTextFormField(
          hintText: S.of(context).email,
        ),
        verticalSpace(18),
        AppTextFormField(
          hintText: S.of(context).password,
          secure: true,
          suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.visibility_off_outlined,
                color: AppColors.gray60,
              )),
        ),
        verticalSpace(25),
        Align(
          alignment: Alignment.topRight,
          child: InkWell(
            onTap: () {},
            child: Text(
              S.of(context).forgot_password,
              style: AppTextStyle.font12MainBlueWeight400,
            ),
          ),
        ),
        verticalSpace(40),
        AppTextButton(
          buttonText: S.of(context).login,
          onPressed: () {},
        ),
      ],
    ));
  }
}
