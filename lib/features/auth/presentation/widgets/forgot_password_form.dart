import 'package:doc_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../../../generated/l10n.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: GlobalKey(),
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            AppTextFormField(
              hintText: S.of(context).email,
              validator: (value) {
                return Validator.validateEmail(value);
              },
            ),
            verticalSpace(434),
            AppTextButton(
              buttonText: S.of(context).reset_password,
              onPressed: () {},
            ),
          ],
        ));
  }
}
