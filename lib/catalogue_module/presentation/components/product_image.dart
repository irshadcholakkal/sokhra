import 'package:flutter/material.dart';
import 'package:lumiereorganics_app/base_module/domain/entity/color_scheme.dart';

import '../../../base_module/presentation/core/values/app_constants.dart';

class ProductImage extends StatelessWidget {
  final double height;
  final double width;
  final List<String> src;
  final String assetSrc;

  const ProductImage({
    Key? key,
    required this.height,
    required this.width,
    required this.src,
    required this.assetSrc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorScheme.onPrimaryLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.cornerRadius / 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(AppConstants.cornerRadius / 4),
        ),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            src.isNotEmpty
                ? Image.network(
                    src.first,
                    fit: BoxFit.cover,
                    height: height,
                    width: width,
                  )
                : Container(
                    height: height,
                    width: width,
                    color: Colors.grey,
                  )
            // Image.asset(
            //     assetSrc ?? CoreAssets.LOGO_FADED,
            //     fit: BoxFit.cover,
            //     height: height,
            //     width: width,
            //   ),
          ],
        ),
      ),
    );
  }
}
