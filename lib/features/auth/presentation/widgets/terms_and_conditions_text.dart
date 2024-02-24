import 'package:doc_app/core/theme/app_text_styles.dart';
import 'package:doc_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: S.of(context).by_logging_you_agree,
            style:
                AppTextStyle.font12Gray60Weight400.copyWith(wordSpacing: 1.5),
          ),
          TextSpan(
            text: S.of(context).terms_conditions,
            style: AppTextStyle.font12Gray24Weight400,
          ),
          TextSpan(
            text: S.of(context).and,
            style:
                AppTextStyle.font12Gray60Weight400.copyWith(wordSpacing: 1.5),
          ),
          TextSpan(
            text: S.of(context).privacy_policy,
            style:
                AppTextStyle.font12Gray24Weight400.copyWith(wordSpacing: 1.5),
          ),
        ],
      ),
    );
  }
}
