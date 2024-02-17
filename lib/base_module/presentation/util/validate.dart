import 'package:string_validator/string_validator.dart';

import '../../domain/entity/translation.dart';

class Validate {
  static String? email(String? value) {
    final _value = value?.trim() ?? "";

    return _value.isEmpty
        ? translation.of("required")
        : !isEmail(_value)
            ? translation.of("invalid_email")
            : null;
  }

  static String? optionalEmail(String? value) {
    final _value = value?.trim() ?? "";

    return _value.isEmpty
        ? null
        : !isEmail(_value)
            ? translation.of("invalid_email")
            : null;
  }

  static String? value(String? value) {
    final _value = value?.trim() ?? "";
    return _value.isEmpty ? translation.of("required") : null;
  }

  static String? number(String? value) {
    final _value = value?.trim() ?? "";

    return _value.isEmpty
        ? translation.of("required")
        : double.tryParse(_value) == null
            ? translation.of("should_be_number")
            : null;
  }

  static String? equal(String? value1, String? value2) {
    final _value1 = value1?.trim() ?? "";
    final _value2 = value2?.trim() ?? "";

    return _value1.isNotEmpty && _value1 != _value2
        ? translation.of("not_equal")
        : null;
  }

  static String? password(String? value) {
    final _value = value?.trim() ?? "";

    return _value.isEmpty
        ? translation.of("required")
        : _value.length < 6
            ? translation.of("password_length")
            : null;
  }

  static String? phone(String? value) {
    final _value = value?.trim() ?? "";

    return _value.isEmpty
        ? translation.of("required")
        : !RegExp(r'^[0-9]{10,}$').hasMatch(_value)
            ? translation.of("mobile_length")
            : null;
  }

  static String? optionalPhone(String? value) {
    final _value = value?.trim() ?? "";

    return _value.isEmpty
        ? null
        : !RegExp(r'^[0-9]{6,}$').hasMatch(_value)
            ? translation.of("mobile_length")
            : null;
  }
}
