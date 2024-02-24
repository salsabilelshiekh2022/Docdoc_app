import 'package:doc_app/core/theme/app_colors.dart';
import 'package:doc_app/core/theme/app_text_styles.dart';
import 'package:doc_app/core/utils/extention.dart';
import 'package:flutter/material.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/routing/routes.dart';
import '../../../../generated/l10n.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        getIt<CacheHelper>().cacheData(key: "isOnBoardingVisited", value: true);
        context.pushReplacementNamed(Routes.loginPage);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 52),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
      child: Text(
        S.of(context).get_started,
        style: AppTextStyle.font16WhiteWeight600,
      ),
    );
  }
}
