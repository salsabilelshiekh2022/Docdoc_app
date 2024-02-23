import 'package:doc_app/core/theme/app_colors.dart';
import 'package:doc_app/core/utils/spacing.dart';
import 'package:doc_app/core/widgets/app_text_form_field.dart';
import 'package:doc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doc_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/app_text_button.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password, name, phone;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            AppTextFormField(
              hintText: S.of(context).name,
              onSave: (value) {
                name = value;
              },
              validator: (value) {
                return Validator.validateName(value);
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              hintText: S.of(context).phone,
              onSave: (value) {
                phone = value;
              },
              validator: (value) {
                return Validator.validatePhone(value);
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              hintText: S.of(context).email,
              onSave: (value) {
                email = value;
              },
              validator: (value) {
                return Validator.validateEmail(value);
              },
            ),
            verticalSpace(18),
            AppTextFormField(
              hintText: S.of(context).password,
              onSave: (value) {
                password = value;
              },
              validator: (value) {
                return Validator.validatePassword(value);
              },
              secure: isObscureText,
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: Icon(
                    isObscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color:
                        isObscureText ? AppColors.gray60 : AppColors.mainBlue,
                  )),
            ),
            verticalSpace(32),
            AppTextButton(
              buttonText: S.of(context).create_account,
              onPressed: () {
                formKey.currentState!.save();

                if (formKey.currentState!.validate()) {
                  BlocProvider.of<AuthBloc>(context).add(UserRegister(
                      email: email!,
                      password: password!,
                      name: name!,
                      phone: phone!));
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ));
  }
}
