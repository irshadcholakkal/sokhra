import '../../../../base_module/domain/entity/translation.dart';
import '../../../../base_module/presentation/core/values/app_constants.dart';

class StringModifiers {
  static String capitalize(String value) {
    if ( value.trim().isEmpty || translation.isArabic) {
      return value ;
    }

    return value[0].toUpperCase() + value.substring(1);
  }

  static String? toUrl(String value) {
    value = value.trim() ;

    if (value.isNotEmpty) {
      if (value.startsWith("files/")) {
        return '${AppConstants.filesUrl}$value';
      } else if (value.startsWith("http")) {
        return value;
      }
    }

    return null;
  }

  static List<String> processImageList(List<String> list) {
    return list.fold([], (result, item) {
          final url = toUrl(item) ?? "";

          if (url.isNotEmpty) {
            result?.add(url);
          }

          return result;
        }) ??
        [];
  }

  static String? enumToString(value) {
    try {
      return value?.toString().split(".").last;
    } catch (e) {}

    return null;
  }
}
