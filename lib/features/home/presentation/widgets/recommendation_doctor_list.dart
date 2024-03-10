import 'package:flutter/material.dart';

import 'recommendation_doctor_item.dart';

class RecommendationDoctorList extends StatelessWidget {
  const RecommendationDoctorList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: RecommendationDoctorItem(),
          );
        });
  }
}
