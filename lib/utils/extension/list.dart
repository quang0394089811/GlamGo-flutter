extension ListExtension<T> on List<T>? {
  bool get isNullOrEmpty {
    if (this == null) {
      return true;
    }
    if (this is List) {
      return !this!.isNotEmpty;
    }
    return false;
  }

  List get orEmptyList {
    if (this == null) {
      return [];
    }
    if (this is List) {
      return this!;
    }
    return this!;
  }

  bool get isNotNullAndNotEmpty => this != null && this!.isNotEmpty;

  List<T> get listOrEmpty => isNotNullAndNotEmpty ? this! : [];

  List<List<T>> splitListIntoSublists<T>(int sublistSize) {
    if (this == null) return [];
    List<List<T>> result = [];
    for (int i = 0; i < this!.length; i += sublistSize) {
      int end =
          (i + sublistSize < this!.length) ? i + sublistSize : this!.length;
      List<T> list = this!.sublist(i, end).cast<T>();
      result.add(list);
    }
    return result;
  }
}

extension UtilListExtension on List {
  List<Map<String, dynamic>>? toGroupBy(String key) {
    try {
      List<Map<String, dynamic>> result = [];
      List<String> keys = [];

      forEach((f) => keys.add(f[key].toString()));

      for (var k in [...keys.toSet()]) {
        List data = [...where((e) => e[key].toString() == k)];
        result.add({k: data});
      }

      return result;
    } catch (e, s) {
      print(e);
      return null;
    }
  }
}
