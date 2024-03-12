import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'doctor_speciality_item.dart';

class DoctorSpecialityList extends StatelessWidget {
  const DoctorSpecialityList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86.h,
      child: ListView.builder(
          itemCount: doctorSpecialitiesList(context).length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsetsDirectional.only(end: 36.w),
              child: DoctorSpecialityItem(
                  doctorSpacialityModel:
                      doctorSpecialitiesList(context)[index]),
            );
          }),
    );
  }
}
