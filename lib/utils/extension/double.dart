import 'package:intl/intl.dart';
import 'package:project_shop/utils/extension/extension.dart';

extension DoubleConvert on double? {
  int? get toInt {
    if (isNullOrEmpty) {
      return null;
    }
    return this!.toInt();
  }
}

extension DoubleComas on double? {
  bool get isNullOrZero {
    return this == null || this == 0.0;
  }

  double get orZero {
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

  String? get comasFixOne {
    if (isNullOrEmpty) {
      return null;
    }
    final format = NumberFormat("###,###.#", "en_US");
    return format.format(this!);
  }

  // Format number to fixed one decimal
  // Ex: 19.80
  String? get comasFixOneZero {
    if (isNullOrEmpty) {
      return null;
    }
    final format = NumberFormat("#,##0.0", "en_US");
    return format.format(this!);
  }

  String? get comasFixTwo {
    if (isNullOrEmpty) {
      return null;
    }
    final format = NumberFormat("###,###.##", "en_US");
    return format.format(this!);
  }

  String? get comasFixThree {
    if (isNullOrEmpty) {
      return null;
    }
    final format = NumberFormat("###,###.###", "en_US");
    return format.format(this!);
  }

  // Format number to fixed two decimal
  // Ex: 19.80
  String? get comasFixTwoZero {
    if (isNullOrEmpty) {
      return null;
    }
    final format = NumberFormat("#,##0.00", "en_US");
    return format.format(this!);
  }

  String? get comasFixTwoOrNull {
    if (this == null) {
      return null;
    }
    final format = NumberFormat("#,##0.00", "en_US");
    return format.format(this!);
  }

  String? get comasFixOneOrNull {
    if (this == null) {
      return null;
    }
    final format = NumberFormat("#,##0.0#", "en_US");
    return format.format(this!);
  }

  String? get comasFixZeroOrNull {
    if (this == null) {
      return null;
    }
    final format = NumberFormat("###,###", "en_US");
    return format.format(this!);
  }

  String? get comasFix {
    if (isNullOrEmpty) {
      return null;
    }
    final format = NumberFormat("#,##0.0#", "en_US");
    return format.format(this!);
  }

  String? get comasFixThreeZero {
    if (isNullOrEmpty) {
      return null;
    }
    final format = NumberFormat("#,##0.000", "en_US");
    return format.format(this!);
  }

  String? get removeRedundantZero {
    if (this == null) {
      return null;
    }
    if (toString().endsWith('.0')) {
      return toString().replaceFirst('.0', '');
    }
    return toString();
  }
}

extension IBDouble on double? {
  double? get safe {
    if (this != null && this != 0) {
      return this;
    }
    return null;
  }
}
