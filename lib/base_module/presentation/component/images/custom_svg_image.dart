import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:string_validator/string_validator.dart';

import '../../core/values/app_assets.dart';

class CustomSvgImage extends StatelessWidget {
  final String? svgAsset;
  final String? svgUrl;
  final double? height;
  final double? width;
  final double? opacity;
  final Color? color;
  final BoxFit? fit;

  const CustomSvgImage({
    Key? key,
    this.svgAsset,
    this.svgUrl,
    this.height,
    this.width,
    this.opacity,
    this.color,
    this.fit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final url = svgUrl?.trim() ?? "";

    return Opacity(
      opacity: opacity ?? 1.0,
      child: isURL(url)
          ? SvgPicture.network(
              url,
              height: height,
              width: width,
              fit: fit ?? BoxFit.cover,
              color: color,
            )
          : SvgPicture.asset(
              svgAsset ?? ThemeAssets.appIconSecondary,
              height: height,
              width: width,
              fit: fit ?? BoxFit.cover,
              color: color,
            ),
    );
  }
}
