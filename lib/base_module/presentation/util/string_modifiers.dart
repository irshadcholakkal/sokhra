import 'package:intl/intl.dart';
import 'package:string_validator/string_validator.dart';

import '../core/values/app_constants.dart';

class StringModifiers {
  static String capitalize(String? value) {
    final _value = value?.trim() ?? "";

    return _value.isEmpty
        ? _value
        : _value[0].toUpperCase() + _value.substring(1);
  }

  static String? toUrl(String? value) {
    final _value = value?.trim() ?? "";

    if (_value.isNotEmpty) {
      if (_value.startsWith("files/")) {
        return '${AppConstants.filesUrl}$value';
      } else if (isURL(_value)) {
        return value;
      }
    }

    return null;
  }

  static List<String> processUrlList(List<String>? list) {
    return list?.fold(
            [],
            (List<String> result, String? item) {
              final url = toUrl(item) ?? "";

              if (url.isNotEmpty) {
                result.add(url);
              }

              return result;
            } as List<String>? Function(List<String>?, String)) ??
        [];
  }

  static List<String> processVideoUrlList(List<String>? list) {
    return list?.fold(
            [],
            (List<String> result, String? item) {
              final uri = Uri.parse(item ?? "");

              if (uri.host.isNotEmpty) {
                if (uri.host.contains("vimeo")) {
                  final videoId = uri.path.replaceAll("/", "");

                  if (videoId.isNotEmpty) {
                    // result.add("vimeo_$videoId");
                  }
                } else if (uri.host.contains("youtu")) {
                  // final videoId = YoutubePlayer.convertUrlToId(item);
                  //
                  // if (videoId.isNotEmpty) {
                  //   result.add("youtube_$videoId");
                  // }
                } else {
                  // result.add("other_$item");
                }
              }

              return result;
            } as List<String>? Function(List<String>?, String)) ??
        [];
  }

  static String? enumToString(
    dynamic value, {
    bool capitalize = false,
    bool lowercase = false,
  }) {
    try {
      final String _value = value.toString().split(".").last;
      return capitalize
          ? _value[0].toUpperCase() + _value.substring(1).toLowerCase()
          : lowercase
              ? _value.toLowerCase()
              : _value;
    } catch (e) {
      return null;
    }
  }

  static String formatNumber(
    num? number, {
    bool nonZero = false,
  }) {
    final _number = num.tryParse(number?.toString() ?? "") ?? 0;

    return nonZero
        ? _number > 0
            ? NumberFormat("###.###").format(_number)
            : ""
        : NumberFormat("###.###").format(_number);
  }

  static String formatToKD(num? number) {
    return "${formatNumber(number)} KD";
  }
}
