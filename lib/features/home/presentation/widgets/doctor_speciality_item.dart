import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../generated/l10n.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem({
    super.key,
    required this.doctorSpacialityModel,
  });
  final DoctorSpacialityModel doctorSpacialityModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 56.w,
            height: 56.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.r),
              color: const Color(0XFFF4F8FF),
            ),
            child: Center(
              child: Image.asset(
                doctorSpacialityModel.image,
                width: 24.w,
                height: 24.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        verticalSpace(12),
        Text(
          doctorSpacialityModel.title,
          style: AppTextStyle.font12Gray24Weight400,
        )
      ],
    );
  }
}

class DoctorSpacialityModel {
  final String title;
  final String image;

  DoctorSpacialityModel({required this.title, required this.image});
}

List<DoctorSpacialityModel> doctorSpecialitiesList(BuildContext context) => [
      DoctorSpacialityModel(
        title: S.of(context).general,
        image: AppAssets.generalDoctor,
      ),
      DoctorSpacialityModel(
        title: S.of(context).neuro_logic,
        image: AppAssets.brain,
      ),
      DoctorSpacialityModel(
        title: S.of(context).pediatric,
        image: AppAssets.baby,
      ),
      DoctorSpacialityModel(
        title: S.of(context).rediology,
        image: AppAssets.kidneys,
      ),
    ];
