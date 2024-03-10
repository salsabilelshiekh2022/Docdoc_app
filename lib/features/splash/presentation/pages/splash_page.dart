import 'package:doc_app/core/routing/routes.dart';
import 'package:doc_app/core/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    bool isOnBoardingVisited =
        getIt<CacheHelper>().getData(key: "isOnBoardingVisited") ?? false;

    bool isLogin =
        getIt<CacheHelper>().getData(key: "CacheUser") != null ? true : false;

    if (isLogin) {
      Future.delayed(const Duration(seconds: 2), () {
        context.pushReplacementNamed(Routes.navBar);
      });
    } else if (isOnBoardingVisited) {
      Future.delayed(const Duration(seconds: 2), () {
        context.pushReplacementNamed(Routes.loginPage);
      });
    } else {
      Future.delayed(const Duration(seconds: 2), () {
        context.pushReplacementNamed(Routes.onBoardingPage);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(AppAssets.docdocLogoLowOpacity),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppAssets.docdocLogo,
                  width: 72.w,
                  height: 72.h,
                ),
                horizontalSpace(10),
                Text(
                  S.of(context).title,
                  style:
                      AppTextStyle.font24Gray24Weight700.copyWith(fontSize: 32),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
