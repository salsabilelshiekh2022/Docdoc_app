import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.font24MainBlueWeight700,
        ),
        verticalSpace(8),
        Text(
          subtitle,
          style: AppTextStyle.font14Gray70Weight400,
        ),
      ],
    );
  }
}
