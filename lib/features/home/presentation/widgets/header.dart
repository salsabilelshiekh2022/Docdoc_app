import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class Header extends StatelessWidget {
  const Header(
      {super.key, required this.title, required this.subTitle, this.onTap});
  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.font18Gray24Weight700
              .copyWith(fontWeight: FontWeight.w600),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            subTitle,
            style: AppTextStyle.font12MainBlueWeight400,
          ),
        ),
      ],
    );
  }
}
