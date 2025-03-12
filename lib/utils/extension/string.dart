import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_shop/base/util/utils.dart';
import 'package:project_shop/utils/constant.dart';
import 'package:project_shop/utils/extension/extension.dart';
// import 'package:office/base/utils/utils.dart';
// import 'package:office/utils/constant.dart';
// import 'package:office/utils/extension/generic.dart';

extension Convert on String? {
  int? get toInt {
    if (this == null) {
      return null;
    }
    return int.tryParse(this!);
  }

  double? get toDouble {
    if (this == null) {
      return null;
    }
    return double.tryParse(this!);
  }

  DateTime? tryParseYYYYMMDD() {
    try {
      final convert =
          '${this?.substring(0, 4)}/${this?.substring(4, 6)}/${this?.substring(6, 8)}';
      return DateFormat('yyyy/MM/dd').parse(convert);
    } on Exception catch (_) {
      debugPrint('error= $_');
      return null;
    }
  }
}

extension Line on String? {
  int get lineLength => '\n'.allMatches(this ?? '').length + 1;
}

extension HexColor on String {
  Color get color => Color(int.parse('0xff$this'));
}

extension StringUtils on String? {
  String? get noAccentVietnamese {
    if (this == null) return null;

    String s = this!;
    s = s.replaceAll(RegExp(r'[àáạảãâầấậẩẫăằắặẳẵ]'), 'a');
    s = s.replaceAll(RegExp(r'[ÀÁẠẢÃĂẰẮẶẲẴÂẦẤẬẨẪ]'), 'A');
    s = s.replaceAll(RegExp(r'[èéẹẻẽêềếệểễ]'), 'e');
    s = s.replaceAll(RegExp(r'[ÈÉẸẺẼÊỀẾỆỂỄ]'), 'E');
    s = s.replaceAll(RegExp(r'[òóọỏõôồốộổỗơờớợởỡ]'), 'o');
    s = s.replaceAll(RegExp(r'[ÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠ]'), 'O');
    s = s.replaceAll(RegExp(r'[ìíịỉĩ]'), 'i');
    s = s.replaceAll(RegExp(r'[ÌÍỊỈĨ]'), 'I');
    s = s.replaceAll(RegExp(r'[ùúụủũưừứựửữ]'), 'u');
    s = s.replaceAll(RegExp(r'[ƯỪỨỰỬỮÙÚỤỦŨ]'), 'U');
    s = s.replaceAll(RegExp(r'[ỳýỵỷỹ]'), 'y');
    s = s.replaceAll(RegExp(r'[ỲÝỴỶỸ]'), 'Y');
    s = s.replaceAll(RegExp(r'[Đ]'), 'D');
    s = s.replaceAll(RegExp(r'[đ]'), 'd');
    return s;
  }

  String cut(int start, int end) => contentOrEmpty.substring(
      start, contentOrEmpty.length > end ? end : contentOrEmpty.length);

  String append(String add) {
    if (isNullOrEmpty) {
      return '';
    } else {
      return this! + add;
    }
  }

  String? get removeAllWhiteSpace {
    if (!isNullOrEmpty) {
      return this!.replaceAll(' ', '');
    }
    return null;
  }

  String? get removeLastEndDecimalZero {
    if (!isNullOrEmpty) {
      // if (this!.length > 0 && this!.endsWith('.0')) {
      //   return this!.substring(0, this!.length - 2);
      // }
      if (this!.length > 0 && this!.endsWith('0')) {
        return this!.substring(0, this!.length - 1);
      }
      return null;
    }
  }

  String? get removeAllEndDecimalZero {
    if (!isNullOrEmpty) {
      final req = this.removeLastEndDecimalZero;
      if (req == this) {
        return this;
      } else {
        return removeLastEndDecimalZero;
      }
    }
    return null;
  }

  String get orEmpty {
    if (!isNullOrEmpty) {
      return this!;
    }
    return '';
  }

  String get orZero {
    if (!isNullOrEmpty) {
      return this!;
    }
    return '0';
  }

  String get orDash {
    if (!isNullOrEmpty) {
      return this!;
    }
    return Constant.emptyPlaceHolder;
  }

  String orString(String value) {
    if (!isNullOrEmpty) {
      return this!;
    }
    return value;
  }

  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return double.tryParse(this ?? '') != null;
  }

  String get contentOrEmpty {
    if (!isNullOrEmpty) {
      return this!;
    }
    return Constant.emptyPlaceHolder;
  }

  bool get isEmptyOrEmptyPlaceHolder {
    if (isNullOrEmpty || this == Constant.emptyPlaceHolder) {
      return true;
    }
    return false;
  }

  bool asBool() {
    if (isNullOrEmpty) {
      return false;
    }
    int? value = int.tryParse(this!);
    if (value.isNullOrEmpty) {
      return false;
    }
    return value!.isOdd;
  }

  bool toBoolean() {
    print(this);
    return (this?.toLowerCase() == "true" || this?.toLowerCase() == "1")
        ? true
        : (this?.toLowerCase() == "false" || this?.toLowerCase() == "0"
            ? false
            : false);
  }

  String get orFilenameFromPath {
    if (this?.isEmpty == true) return "";
    File file = File(this!);
    return file.path.split('/').last;
  }

  bool isImageType() {
    // List of valid image file extensions
    final validExtensions = [
      'jpg',
      'jpeg',
      'png',
      'gif',
      'bmp',
      'webp',
      'tiff'
    ];

    // Extract the file extension from the path
    final extension = this?.toLowerCase().split('.').last.toLowerCase();

    // Check if the extension is in the list of valid image extensions
    return validExtensions.contains(extension);
  }

  String get contentOrNa {
    if (!isNullOrEmpty) {
      return this!;
    }
    return Constant.naPlaceHolder;
  }

  bool get isHttpLink {
    if (isNullOrEmpty) return false;
    final uri =
        Uri.tryParse(this!); // Kiểm tra nếu `path` có thể parse thành URI
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }
}

extension URLParse on String? {
  Map<String, String> get queries {
    if (isNullOrEmpty) {
      return {};
    }
    return Uri.parse(this!).queryParameters;
  }

  String? queryWithName(String name) {
    if (isNullOrEmpty) {
      return null;
    }
    return queries[name];
  }
}

extension Secure on String? {
  String asSecuredPhoneNumber() {
    final number = this ?? '';
    if (number.isEmpty) {
      return '****';
    }

    if (number.length < 6) {
      return '****';
    }

    return '${number.substring(0, 2)}****${number.substring(number.length - 3)}';
  }

  String asSecuredEmail() {
    final email = this ?? '';
    if (email.isEmpty) {
      return '****';
    }

    final atIndex = email.indexOf('@');

    if (atIndex == -1) {
      return '****';
    }

    if (atIndex < 4) {
      return '****${email.substring(atIndex)}';
    }

    return '${email.substring(0, 1)}****${email.substring(atIndex - 2)}';
  }

  String asFileName() {
    String? result = this;
    if (isNullOrEmpty) return "";
    if (this?.startsWith('\/') == true) {
      result = this?.substring(1);
    }
    result = result?.replaceAll('\/', "_");
    return result!;
  }

  String convertTimeWithSpecificHour() {
    if (isNullOrEmpty) return "";
    DateFormat inputFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
    DateTime dateTime = inputFormat.parse(this ?? "");

    DateFormat outputFormat = DateFormat("HH:mm - dd/MM/yyyy");
    String formattedDateTime = outputFormat.format(dateTime);

    return formattedDateTime;
  }

  String convertTimeIntoDateHour() {
    if (isNullOrEmpty) return "";
    DateFormat inputFormat = DateFormat("dd/MM/yyyy HH:mm:ss");
    DateTime dateTime = inputFormat.parse(this ?? "");

    DateFormat outputFormat = DateFormat("dd/MM/yyyy HH:mm");
    String formattedDateTime = outputFormat.format(dateTime);

    return formattedDateTime;
  }

  String? extractEmailPrefix() {
    if (Utils.I.isValidEmail(this ?? "")) {
      int atIndex = this?.indexOf('@') ?? -1;
      if (atIndex != -1) {
        return this?.substring(0, atIndex);
      }
    }
    return "";
  }
}

extension toDateTime on String? {
  DateTime get to_dd_mm_yyyy_DateTime {
    final now = DateTime.now();
    if (isNullOrEmpty) {
      return now;
    }
    final dateTime = DateFormat("dd/MM/yyyy").parse(this!);

    return dateTime;
  }
}

extension FormatMultilineText on String {
  String formatMultiline({int? numOfLines}) {
    List<String> lines = split('\n');

    if (lines.length == 1) {
      return lines[0];
    }

    if (numOfLines != null) {
      String line = "";
      for (int i = 0; i < numOfLines; i++) {
        if (line.isNotEmpty) {
          line = '$line\n${lines[i]}';
        } else {
          line = lines[i];
        }
      }
      return "$line...";
    }

    return '${lines[0]}...';
  }
}

extension ToNonAccentVietnamese on String {
  String toNonAccentVietnamese() {
    var name = this;
    name = name.replaceAll(RegExp(r'[AÁÀÃẠÂẤẦẪẬĂẮẰẴẶ]'), "A");
    name = name.replaceAll(RegExp(r'[àáạảãâầấậẩẫăằắặẳẵ]'), "a");
    name = name.replaceAll(RegExp(r'[EÉÈẼẸÊẾỀỄỆ]'), "E");
    name = name.replaceAll(RegExp(r'[èéẹẻẽêềếệểễ]'), "e");
    name = name.replaceAll(RegExp(r'[IÍÌĨỊ]'), "I");
    name = name.replaceAll(RegExp(r'[ìíịỉĩ]'), "i");
    name = name.replaceAll(RegExp(r'[OÓÒÕỌÔỐỒỖỘƠỚỜỠỢ]'), "O");
    name = name.replaceAll(RegExp(r'[òóọỏõôồốộổỗơờớợởỡ]'), "o");
    name = name.replaceAll(RegExp(r'[UÚÙŨỤƯỨỪỮỰ]'), "U");
    name = name.replaceAll(RegExp(r'[ùúụủũưừứựửữ]'), "u");
    name = name.replaceAll(RegExp(r'[YÝỲỸỴ]'), "Y");
    name = name.replaceAll(RegExp(r'[ỳýỵỷỹ]'), "y");
    name = name.replaceAll(RegExp(r'[Đ]'), "D");
    name = name.replaceAll(RegExp(r'[đ]'), "d");
    name = name.replaceAll(RegExp(r'[\u0300\u0301\u0303\u0309]'), "");
    name = name.replaceAll(RegExp(r'[\u02C6\u0306\u031B]'), "");
    return name;
  }
}

extension StringX on String {
  DateTime toDateTime({String format = Constant.ddMMyyyy}) {
    return DateFormat(format).parse(this);
  }
}
