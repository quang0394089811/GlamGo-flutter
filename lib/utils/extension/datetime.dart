// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';

// extension IBDateTime on DateTime? {
//   DateTime get dateTimeToGMT7 {
//     final timezone = getLocation('Asia/Ho_Chi_Minh');

//     return TZDateTime.from(this ?? DateTime.now(), timezone);
//   }

//   DateTime? get removeTimeDate {
//     final year = this?.year;
//     final month = this?.month;
//     final day = this?.day;
//     if (this != null && year != null) {
//       return DateTime(year, month ?? 1, day ?? 1, 0, 0, 0, 0, 0);
//     }
//     return null;
//   }

//   String toDateString(String format) {
//     return DateFormat(format).format(this ?? DateTime.now());
//   }
// }

// extension DateTimeEx on DateTime {
//   static DateTime? tryParse(String format, String value) {
//     try {
//       return DateFormat(format).parse(value);
//     } on Exception catch (_) {
//       return null;
//     }
//   }

//   // compare GMT+7 date time to local regardless timezone
//   int compareToLocal(DateTime local, {bool dateOnly = false}) {
//     final gmt7 = local.dateTimeToGMT7;
//     DateTime self;
//     DateTime compare;

//     if (dateOnly) {
//       self = DateTime(year, month, day, 0, 0, 0, 0, 0);
//       compare = DateTime(gmt7.year, gmt7.month, gmt7.day, 0, 0, 0, 0, 0);
//     } else {
//       self = DateTime(year, month, day, hour, minute, second, 0, 0);
//       compare = DateTime(gmt7.year, gmt7.month, gmt7.day, gmt7.hour,
//           gmt7.minute, gmt7.second, 0, 0);
//     }

//     return self.compareTo(compare);
//   }

//   String lunarCalendar() {
//     String lunarDate = "";
//     cc.TimeZone timeZone = cc.TimeZone();
//     DateTime now = this;
//     int offsetFromUtc = timeZone.getOffset(now) ~/ 3600000;

//     cc.CalendarConverter converter = cc.CalendarConverter.I;
//     int jd = converter.jdFromDate(day, month, year);

//     List<int> s = converter.jdToDate(jd);
//     List<String> l = converter.convertSolar2Lunar(
//         s[0], s[1], s[2], offsetFromUtc.toDouble());

//     if (l[0] == "1") {
//       lunarDate = "${l[0]}/${l[1]}";
//     } else {
//       lunarDate = l[0];
//     }

//     return lunarDate;
//   }

//   DateTime get lunar {
//     cc.TimeZone timeZone = cc.TimeZone();
//     DateTime now = this;
//     int offsetFromUtc = timeZone.getOffset(now) ~/ 3600000;

//     cc.CalendarConverter converter = cc.CalendarConverter.I;
//     int jd = converter.jdFromDate(day, month, year);

//     List<int> s = converter.jdToDate(jd);
//     List<String> l = converter.convertSolar2Lunar(
//         s[0], s[1], s[2], offsetFromUtc.toDouble());

//     String lunarDate = "${l[0]}/${l[1]}/${l[2]}";

//     return DateFormat('dd/MM/yyyy').parse(lunarDate);
//   }

//   DateTime get firstDateOfWeek => subtract(Duration(days: weekday - 1));

//   DateTime get lastDateOfWeek =>
//       add(Duration(days: DateTime.daysPerWeek - weekday));

//   bool checkDaysInWeek(DateTime other) {
//     return firstDateOfWeek.isSameDate(other.firstDateOfWeek);
//   }

//   List<DateTime> getDisplayCalendar() {
//     DateTime firstMonth = DateTime(year, month, 1);
//     DateTime first = firstMonth.firstDateOfWeek;
//     DateTime lastMonth = DateTime(year, month + 1, 0);
//     DateTime last = lastMonth.lastDateOfWeek;
//     return getDaysInBetween(first, last);
//   }

//   List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
//     List<DateTime> days = [];
//     for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
//       days.add(startDate.add(Duration(days: i)));
//     }
//     return days;
//   }

//   List<DateTime> get getListDateTime {
//     List<DateTime> list = [];
//     DateTime firstDate = this;
//     for (int i = 0; i < 7; i++) {
//       list.add(firstDate.add(Duration(days: i)));
//     }
//     return list;
//   }

//   DateTime get firstDateOfNextWeek =>
//       firstDateOfWeek.add(const Duration(days: 7));

//   DateTime get firstDateOfLastWeek =>
//       firstDateOfWeek.subtract(const Duration(days: 7));

//   bool checkInTime({
//     required DateTime startDate,
//     required DateTime endDate,
//   }) {
//     //this>=startDate
//     bool check1 = !startDate.isAfter(this);
//     //this<=endDate
//     bool check2 = !endDate.isBefore(this);
//     return check1 && check2;
//   }

//   //số phút từ minDate đến this
//   int getMinute({DateTime? minDate, int min = 8}) {
//     int minTimeMinute =
//         minDate != null ? (minDate.hour * 60 + minDate.minute) : (min * 60 + 0);
//     int maxTimeMinute = hour * 60 + minute;
//     return maxTimeMinute - minTimeMinute;
//   }

//   // String get showFullDateTime {
//   //   final languageCode = Get.safeFind<LangController>()?.languageCode;

//   //   return '${getDayOfWeek.tr}, ${languageCode == 'vi' ? "ngày" : ''} ${DateFormatter.formatDate9(this, formatInput: Constant.FORMAT_DD_MM_YY, locale: "lang_code".tr)}';
//   // }

//   String get getDayOfWeek {
//     switch (weekday) {
//       case 1:
//         return 'monday1';
//       case 2:
//         return 'tuesday1';
//       case 3:
//         return 'wednesday1';
//       case 4:
//         return 'thursday1';
//       case 5:
//         return 'friday1';
//       case 6:
//         return 'saturday1';
//       case 7:
//         return 'sunday1';
//       default:
//         return '';
//     }
//   }

//   int calculateWeekdayDifference(DateTime other) {
//     DateTime startDate = this;
//     DateTime endDate = other;

//     if (startDate.isAfter(endDate)) {
//       DateTime temp = startDate;
//       startDate = endDate;
//       endDate = temp;
//     }

//     int weekdayCount = 0;
//     DateTime currentDate = startDate;

//     // Iterate through each day
//     while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
//       // Check if the day is a weekday (Monday to Friday)
//       if (currentDate.weekday != DateTime.saturday &&
//           currentDate.weekday != DateTime.sunday) {
//         weekdayCount++;
//       }
//       // Move to the next day
//       currentDate = currentDate.add(const Duration(days: 1));
//     }

//     if (currentDate.weekday == DateTime.saturday &&
//         currentDate.weekday == DateTime.sunday) {
//       return weekdayCount;
//     }

//     return weekdayCount - 1;
//   }
// }

// extension DateOnlyCompare on DateTime {
//   bool isSameDate(DateTime other) {
//     return year == other.year && month == other.month && day == other.day;
//   }

//   bool isSameTime(DateTime other) {
//     return hour == other.hour && minute == other.minute;
//   }

//   int compareToTime(DateTime other) {
//     TimeOfDay a = TimeOfDay(hour: hour, minute: minute);
//     TimeOfDay b = TimeOfDay(hour: other.hour, minute: other.minute);
//     return a.compareTo(b);
//   }

//   bool isBetween6PmAnd6Am() {
//     final now = DateTime.now();
//     final sixPmToday = DateTime(now.year, now.month, now.day, 18);
//     final sixAmTomorrow = DateTime(now.year, now.month, now.day + 1, 6);

//     return isAfter(sixPmToday) && isBefore(sixAmTomorrow);
//   }
// }

// extension DateExt on DateTime {
//   DateTime get firstDate => DateTime(year, month, 1);

//   DateTime get lastDate => DateTime(year, month, 30);
// }

// extension TimeOfDayExtension on TimeOfDay {
//   int compareTo(TimeOfDay other) {
//     if (hour < other.hour) return -1;
//     if (hour > other.hour) return 1;
//     if (minute < other.minute) return -1;
//     if (minute > other.minute) return 1;
//     return 0;
//   }
// }
