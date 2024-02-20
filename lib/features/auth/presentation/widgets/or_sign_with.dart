import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';

class OrSignWith extends StatelessWidget {
  const OrSignWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomDivider(),
        horizontalSpace(3),
        Text(
          S.of(context).or_Sign_in_with,
          style: AppTextStyle.font12Gray60Weight400,
        ),
        horizontalSpace(3),
        const CustomDivider()
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Expanded(
        child: Divider(
      color: AppColors.gray40,
      thickness: 1,
      //endIndent: 200,
    ));
  }
}
