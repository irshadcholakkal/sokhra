import 'package:flutter/material.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';
import 'package:shimmer/shimmer.dart';

import '../../../base_module/presentation/core/values/app_constants.dart';

class ShimmerGridCard extends StatelessWidget {
  const ShimmerGridCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstants.cornerRadius)),
        child: Container(
            width: 155,
            height: 250,
            child: Column(
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: AppColorScheme.onPrimaryLight.withOpacity(0.6),
                  period: Duration(seconds: 5),
                  child: Container(
                    width:155,
                    height: 120,
                    color: Colors.yellow,
                  ),
                ),
                SizedBox(height: AppConstants.defaultPadding *0.5,)  ,
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: AppColorScheme.onPrimaryLight.withOpacity(0.6),
                  period: Duration(seconds: 5),
                  child: Container(
                    width:155,
                    height: 110,
                    color: Colors.yellow,
                  ),
                ),


              ],
            ))
    );
  }
}
