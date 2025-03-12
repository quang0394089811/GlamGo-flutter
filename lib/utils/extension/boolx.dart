/// Helper class with a single method to convert a `dynamic` object to a `bool`
class BoolHelper {
  /// Method to convert anything to a `bool`
  /// The following objects are considered as `false`:
  /// * `null`
  /// * `0` And `0.0`
  /// * `double.nan` "Not a Number" values
  /// * `""` Empty Strings
  /// * `[]` Empty iterable objects
  /// * `<any>.isEmpty` == true Whatever object with a `isEmpty` property that returns true (i.e, a Map or any custom class that implement isEmpty)
  ///
  /// All other object values are considered as `true`
  static bool convertToBool(value) {
    if (value == null) {
      return false;
    }
    if (value is bool) {
      return value;
    }
    if ((value is String || value is Iterable || value is Map) &&
        value.isEmpty) {
      return false;
    }
    if (value is double && value.isNaN) {
      return false;
    }
    if (value is num && value.isFinite && value.toInt() == 0) {
      return false;
    }
    try {
      return !value.isEmpty;
    } catch (errorOnIsEmpty) {
      // Enpty on purpose
    }

    return true;
  }
}

/// Public helper method for friendly use of the original `BoolHelper.convertToBool`
const asBool = BoolHelper.convertToBool;

/// Extension to add the property `.asBool` to everything in dart
extension WhateverToBoolExtension on dynamic {
  /// Property that converts the current object to a `bool` instance
  bool get asBool => BoolHelper.convertToBool(this);
}

/// Extension to add the operator `~` to everything in dart except `int` objects
extension WhateverToBoolOperator on dynamic {
  /// Operator that converts the current object to a negate `bool` instance
  /// You can use it twice (`~~myValue`) to get the actual `bool` value of the current object
  bool operator ~() => !asBool(this);
}

extension ConvertBool on bool? {
  bool get orNull {
    if (this != null) {
      return this!;
    }
    return false;
  }
}
