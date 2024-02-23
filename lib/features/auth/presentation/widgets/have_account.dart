import 'package:doc_app/core/theme/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAccountText extends StatelessWidget {
  const HaveAccountText(
      {super.key,
      required this.haveAccount,
      required this.signinOrSignUp,
      required this.onPressed});
  final String haveAccount;
  final String signinOrSignUp;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: haveAccount,
              style: AppTextStyle.font12Gray24Weight400
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            TextSpan(
                text: signinOrSignUp,
                style: AppTextStyle.font12MainBlueWeight400
                    .copyWith(fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()..onTap = onPressed),
          ],
        ),
      ),
    );
  }
}
