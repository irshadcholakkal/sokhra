import 'package:intl/intl.dart';

import '../../domain/entity/models/date_time_info.dart';
import '../../domain/entity/translation.dart';

class DateTimeHelper {
  late DateTime _lastFetchDateTime;
  DateTime? _currentDateTime;
  final _timeZoneRegion = TimeZoneRegion.ist;

  DateTime get currentDateTime {
    try {
      DateTime? _dateTime = _currentDateTime;

      if (_dateTime != null) {
        final duration = DateTime.now().difference(_lastFetchDateTime);
        _dateTime = _dateTime.add(duration);
        return _dateTime.toUtc().add(TimeZoneOffset.value(_timeZoneRegion));
      }
    } catch (_) {}

    return DateTime.now().toUtc().add(TimeZoneOffset.value(_timeZoneRegion));
  }

  void setCurrentDateTime(DateTimeInfo? dateTimeInfo) {
    try {
      _lastFetchDateTime = DateTime.now();
      final _utcDateTime = dateTimeInfo?.utcDateTime;

      if (_utcDateTime != null) {
        _currentDateTime = DateTime.parse(_utcDateTime);
      }
    } catch (_) {}
  }

  /// Returns DateTime object with utc true.
  DateTime? toUtcObject(DateTime? dateTime) {
    try {
      if (dateTime != null) {
        return DateTime.utc(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond,
        );
      }
    } catch (_) {}
    return null;
  }

  /// Returns DateTime object with utc false.
  DateTime? toLocalObject(DateTime? dateTime) {
    try {
      if (dateTime != null) {
        return DateTime(
          dateTime.year,
          dateTime.month,
          dateTime.day,
          dateTime.hour,
          dateTime.minute,
          dateTime.second,
          dateTime.millisecond,
          dateTime.microsecond,
        );
      }
    } catch (_) {}
    return null;
  }

  /// Returns DateTime object as date time String.
  /// dateFormat: |yyyy-MM-dd HH:mm|
  /// year: |yyyy|
  /// month: |MM|MMM|MMMM
  /// week: |EEEE|
  /// day: |dd|
  /// hour(24): |HH|
  /// hour(12): |hh|
  /// minute: |mm|
  /// am/pm: |a|
  String? toDateTimeString(
    DateTime? dateTime, {
    bool translate = false,
    String? dateFormat,
  }) {
    try {
      if (dateTime != null) {
        final _language = translate
            ? translation.isArabic
                ? 'ar_SA'
                : 'en_US'
            : null;
        final _dateFormat = dateFormat ?? 'yyyy-MM-dd HH:mm';
        return DateFormat(_dateFormat, _language).format(dateTime);
      }
    } catch (_) {}
    return null;
  }

  DateTime? _dateTimeFromEpochMilliseconds(String? epochValue) {
    try {
      if (epochValue != null) {
        final _epochTime = int.tryParse(epochValue);

        if (_epochTime != null) {
          return DateTime.fromMillisecondsSinceEpoch(
            _epochTime,
            isUtc: false,
          );
        }
      }
    } catch (_) {}
    return null;
  }

  /// Returns DateTime object from dateTime|date|time String.
  /// dateTime: |yyyy-MM-dd HH:mm|
  /// date: |yyyy-MM-dd|
  /// time: |HH:mm|
  DateTime? parseDateTimeString({
    String? dateTime,
    String? date,
    String? time,
  }) {
    try {
      final _epochDateTime = _dateTimeFromEpochMilliseconds(dateTime ?? date);

      if (_epochDateTime != null) {
        return _epochDateTime;
      } else if (dateTime != null) {
        return DateFormat('yyyy-MM-dd HH:mm').parse(
          dateTime,
          true,
        );
      } else if (date != null && time != null) {
        return DateFormat('yyyy-MM-dd HH:mm').parse(
          '$date $time',
          true,
        );
      } else if (date != null) {
        return DateFormat('yyyy-MM-dd HH:mm').parse(
          '$date 00:00',
          true,
        );
      } else if (time != null) {
        return DateFormat('HH:mm').parse(
          time,
          true,
        );
      }
    } catch (_) {}
    return null;
  }

  /// Returns current date time in required format.
  /// dateFormat: |yyyy-MM-dd HH:mm|
  String? getCurrentDateTimeString({
    bool translate = false,
    String? dateFormat,
  }) {
    try {
      return toDateTimeString(
        currentDateTime,
        translate: translate,
        dateFormat: dateFormat,
      );
    } catch (_) {}
    return null;
  }

  /// Returns date time String in required format.
  /// dateFormat: |yyyy-MM-dd HH:mm|
  /// dateTime: |yyyy-MM-dd HH:mm|
  /// date: |yyyy-MM-dd|
  /// time: |HH:mm|
  String? formatDateTimeString({
    String? dateTime,
    String? date,
    String? time,
    bool translate = false,
    String? dateFormat,
  }) {
    try {
      return toDateTimeString(
        parseDateTimeString(
          dateTime: dateTime,
          date: date,
          time: time,
        ),
        translate: translate,
        dateFormat: dateFormat,
      );
    } catch (_) {}
    return null;
  }

  bool equalDates(DateTime? first, DateTime? second) {
    try {
      if (first != null && second != null) {
        return toDateTimeString(
              toUtcObject(first),
              dateFormat: 'yyyy-MM-dd',
            ) ==
            toDateTimeString(
              toUtcObject(second),
              dateFormat: 'yyyy-MM-dd',
            );
      }
    } catch (_) {}

    return false;
  }

  Duration? timeDifference(DateTime? first, DateTime? second) {
    try {
      if (first != null && second != null) {
        //return -ve if second occurs after first
        return toUtcObject(first)?.difference(toUtcObject(second)!);
      }
    } catch (_) {}
    return null;
  }
}

class TimeZoneOffset {
  static Duration value(TimeZoneRegion timeZoneRegion) {
    switch (timeZoneRegion) {
      case TimeZoneRegion.ist:
        return const Duration(hours: 5, minutes: 30);
      case TimeZoneRegion.ast:
        return const Duration(hours: 3);
      default:
        return DateTime.now().timeZoneOffset;
    }
  }
}

enum TimeZoneRegion { ist, ast, gst }

final dateTimeHelper = DateTimeHelper();
