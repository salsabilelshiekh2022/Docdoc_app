import 'package:doc_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_colors.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.hintText,
    this.validator,
    this.onSave,
    this.secure = false,
    this.focusNode,
    this.onEditingComplete,
    this.textInputAction,
    this.keyBoardType,
    this.suffixIcon,
  });
  final bool secure;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSave;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final TextInputType? keyBoardType;
  final VoidCallback? onEditingComplete;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadiusDirectional.circular(16),
      child: SizedBox(
        child: TextFormField(
          keyboardType: keyBoardType,
          obscureText: secure,
          cursorColor: AppColors.gray24,
          onSaved: onSave,

          style: AppTextStyle.font14Gray50Weight500
              .copyWith(color: AppColors.gray24),

          focusNode: focusNode,
          onEditingComplete: onEditingComplete,
          textInputAction: textInputAction,
          validator: validator, //
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 17.h),
            hintText: hintText,
            hintStyle: AppTextStyle.font14Gray50Weight500,
            fillColor: AppColors.form,
            filled: true,
            suffixIcon: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.0),
              borderSide: const BorderSide(color: AppColors.gray30),
            ),
            enabledBorder: inputBorder(AppColors.gray30),
            focusedBorder: inputBorder(AppColors.mainBlue),
            errorBorder: inputBorder(AppColors.red),
            focusedErrorBorder: inputBorder(AppColors.red),
            disabledBorder: inputBorder(AppColors.gray30),
          ),
        ),
      ),
    );
  }
}

InputBorder inputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16.0),
    borderSide: BorderSide(color: color),
  );
}
