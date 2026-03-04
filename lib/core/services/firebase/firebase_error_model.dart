class FirebaseErrorModel {
  final String code;
  final String message;
  final String? plugin;

  const FirebaseErrorModel({
    required this.code,
    required this.message,
    this.plugin,
  });

  @override
  String toString() =>
      'FirebaseErrorModel(code: $code, message: $message, plugin: $plugin)';
}
