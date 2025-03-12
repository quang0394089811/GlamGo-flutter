import 'package:intl/intl.dart';
import 'package:project_shop/utils/extension/extension.dart';

extension IntComas on int? {
  bool get isNullOrZero {
    return this == null || this == 0;
  }

  int get orZero {
    if (isNullOrEmpty) {
      return 0;
    }
    return this!;
  }

  String? get comasFixZero {
    if (isNullOrEmpty) {
      return null;
    }
    final format = NumberFormat("###,###", "en_US");
    return format.format(this!);
  }
}

extension IntFormatter on int? {
  // To format number with comas only
  // Use case: Format quantity
  // Example: 100000 -> 100,0000
  String? get formatVol {
    if (isNullOrEmpty || this == 0) {
      return null;
    }
    final format = NumberFormat("###,###", "en_US");
    return format.format(this!);
  }
}

extension FileSizeExtension on int? {
  String get toFileSize {
    String hrSize = '';
    int currentSize = orZero;
    // double? b = size;
    // double? k = currentSize / 1024.0;
    double m = ((currentSize / 1024.0) / 1024.0);
    // double g = (((currentSize / 1024.0) / 1024.0) / 1024.0);
    // double t = ((((currentSize / 1024.0) / 1024.0) / 1024.0) / 1024.0);

    var formatter = NumberFormat('0.00');

    // if (t > 1) {
    //   hrSize = "${formatter.format(t)} TB";
    // } else if (g > 1) {
    //   hrSize = "${formatter.format(g)} GB";
    // } else if (m > 1) {
    //   hrSize = "${formatter.format(m)} MB";
    // } else if (k > 1) {
    //   hrSize = "${formatter.format(k)} KB";
    // } else {
    //   hrSize = "${formatter.format(b)} Bytes";
    // }
    hrSize = "${formatter.format(m)} MB";

    return hrSize;
  }
}

extension GetZeroPrefix on int {
  String get zeroPrefix {
    if (this < 10) {
      return '0$this';
    }
    return '$this';
  }
}
