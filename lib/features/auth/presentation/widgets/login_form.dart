import 'package:doc_app/core/theme/app_colors.dart';
import 'package:doc_app/core/theme/app_text_styles.dart';
import 'package:doc_app/core/utils/spacing.dart';
import 'package:doc_app/core/widgets/app_text_form_field.dart';
import 'package:doc_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doc_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/validator.dart';
import '../../../../core/widgets/app_text_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
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
                        color: isObscureText
                            ? AppColors.gray60
                            : AppColors.mainBlue,
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
                  onPressed: () {
                    formKey.currentState!.save();

                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context)
                          .add(UserLogin(email: email!, password: password!));
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ],
            ));
      },
    );
  }
}
