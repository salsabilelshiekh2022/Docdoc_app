import 'package:doc_app/core/theme/app_text_styles.dart';
import 'package:doc_app/core/utils/app_assets.dart';
import 'package:doc_app/core/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../generated/l10n.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.docdocLogo),
        horizontalSpace(10),
        Text(
          S.of(context).title,
          style: AppTextStyle.font24Gray24Weight700,
        )
      ],
    );
  }
}
