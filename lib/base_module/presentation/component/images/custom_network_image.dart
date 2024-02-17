import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:string_validator/string_validator.dart';

import 'custom_svg_image.dart';

class CustomNetworkImage extends StatelessWidget {
  final List<String?>? urlList;
  final String? filePath;
  final String? imageAsset;
  final String? svgAsset;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final Border? border;
  final double? borderRadius;
  final bool rounded;
  final double? opacity;
  final bool showPlaceHolder;
  final Color? color;
  final BoxFit? fit;
  final BoxFit? placeHolderFit;
  final EdgeInsetsGeometry? placeHolderPadding;

  const CustomNetworkImage({
    Key? key,
    this.urlList,
    this.filePath,
    this.imageAsset,
    this.svgAsset,
    this.icon,
    this.padding,
    this.height,
    this.width,
    this.border,
    this.borderRadius,
    this.rounded = false,
    this.opacity,
    this.showPlaceHolder = true,
    this.color,
    this.fit,
    this.placeHolderFit,
    this.placeHolderPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = urlList != null && urlList!.isNotEmpty
        ? (urlList?.first?.trim() ?? "")
        : "";
    final imagePath = filePath?.trim() ?? "";

    return Container(
      decoration: BoxDecoration(
        border: border,
        borderRadius: BorderRadius.circular(
          rounded ? 999999 : borderRadius ?? 0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          rounded ? 999999 : borderRadius ?? 0,
        ),
        child: Container(
          padding: padding,
          height: height,
          width: width,
          child: isURL(imageUrl)
              ? _networkImageExtended(imageUrl)
              : imagePath.isNotEmpty
                  ? kIsWeb
                      ? _networkImageExtended(imagePath)
                      : _localImage(imagePath)
                  : _fadedLogo(),
        ),
      ),
    );
  }

  Widget _networkImageExtended(String url) {
    if (url.endsWith(".svg")) {
      return CustomSvgImage(
        svgUrl: url,
        height: height,
        width: width,
        fit: placeHolderFit,
        opacity: opacity,
        color: color,
      );
    }

    return ExtendedImage.network(
      url,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      cache: false,
      enableMemoryCache: false,
      clearMemoryCacheIfFailed: true,
      cacheWidth: 512,
      retries: 5,
      timeRetry: const Duration(milliseconds: 1000),
      mode: ExtendedImageMode.none,
      enableLoadState: true,
      printError: !kReleaseMode,
      loadStateChanged: (state) {
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            return showPlaceHolder
                ? const CupertinoActivityIndicator()
                : const SizedBox();
          case LoadState.completed:
            return null;
          case LoadState.failed:
            state.reLoadImage();
            return _fadedLogo();
          default:
            return null;
        }
      },
    );
  }

  Widget _localImage(String path) {
    return Image.file(
      File(path),
      height: height,
      width: width,
      fit: placeHolderFit ?? BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        }

        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeOut,
          child: child,
        );
      },
      errorBuilder: (_, object, stack) {
        return _fadedLogo();
      },
    );
  }

  Widget _fadedLogo() {
    return Opacity(
      opacity: opacity ?? 1,
      child: Container(
        padding: placeHolderPadding,
        child: Builder(
          builder: (context) {
            if (icon != null) {
              return icon!;
            } else if (imageAsset != null) {
              return Image.asset(
                imageAsset ?? "",
                height: height,
                width: width,
                fit: placeHolderFit ?? BoxFit.cover,
                errorBuilder: (_, object, stack) {
                  return const SizedBox();
                },
              );
            } else if (svgAsset != null || showPlaceHolder == true) {
              return CustomSvgImage(
                svgAsset: svgAsset,
                height: height,
                width: width,
                fit: placeHolderFit,
                opacity: opacity,
                color: color,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
