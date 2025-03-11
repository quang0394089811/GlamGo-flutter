class AppException implements Exception {
  final String? code;
  final String message;

  AppException({
    this.code,
    this.message = 'Something went wrong, please try again later.',
  });

  @override
  String toString() => message;
}
