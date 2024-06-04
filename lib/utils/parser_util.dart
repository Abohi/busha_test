import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';

class ParserUtil<T> {
  static DateTime? parseJsonDate(String? dateString) {
    try {
      return DateTime.parse(dateString!);
    } catch (e) {
      return DateTime.now();
    }
  }

  static String? parseJsonString(
    Object? json,
    String param, {
    String? defaultValue,
    String? jsonSubKey,
    bool isTitleCase = false,
  }) {
    try {
      json = json as Map;

      if (jsonSubKey != null) {
        json = json[jsonSubKey] as Map;
      }

      Object? result = json[param];

      if (result == null) return defaultValue;

      String resultString = result.toString();
      final parsedString =
          resultString.isEmpty ? defaultValue ?? resultString : resultString;

      if (isTitleCase) return parsedString.titleCase;
      return parsedString;
    } catch (e) {
      AppLogger.log(e);
      return null;
    }
  }

  static bool? parseJsonBoolean(Map? json, String param) {
    try {
      Object? result = json![param];

      if (result == null) return null;
      return result as bool;
    } catch (e) {
      return null;
    }
  }

  List<T> parseJsonList({
    required List<dynamic>? json,
    required T Function(Map<String, dynamic> json) fromJson,
    bool isLimitTransactions = false,
  }) {
    try {
      final data;
      if (isLimitTransactions) {
        data = List<Map<String, dynamic>>.from(json!).take(10).toList();
      } else {
        data = List<Map<String, dynamic>>.from(json!);
      }

      return List<T>.from(
        data.map(
          (e) => fromJson(e),
        ),
      );
    } catch (e) {
      AppLogger.log(e);
      return [];
    }
  }

  static double? parseJsonDouble(Map? json, String param) {
    try {
      Object? result = json![param];

      if (result == null) return null;
      var convertedResult = double.parse(result.toString());
      return convertedResult;
    } catch (e) {
      return null;
    }
  }

  static int? parseJsonInt(Map? json, String param) {
    try {
      Object? result = json![param];

      if (result == null) return null;
      var convertedResultToDouble = double.parse(result.toString());
      var convertedResultToInt = convertedResultToDouble.toInt();
      return convertedResultToInt;
    } catch (e) {
      return null;
    }
  }
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
