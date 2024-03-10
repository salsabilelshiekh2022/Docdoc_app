import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';
import '../widgets/doctor_speciality_list.dart';
import '../widgets/header.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_banner.dart';
import '../widgets/recommendation_doctor_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            child: Column(
              children: [
                const HomeAppBar(),
                verticalSpace(12),
                const HomeBanner(),
                verticalSpace(24),
                Header(
                  title: S.of(context).doctor_speciality,
                  subTitle: S.of(context).see_all,
                  onTap: () {},
                ),
                verticalSpace(16),
                const DoctorSpecialityList(),
                verticalSpace(24),
                Header(
                  title: S.of(context).recommendation_doctor,
                  subTitle: S.of(context).see_all,
                  onTap: () {},
                ),
                verticalSpace(20),
                const RecommendationDoctorList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
