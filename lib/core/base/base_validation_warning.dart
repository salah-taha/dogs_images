class BaseValidationWarning {
  const BaseValidationWarning(this.message);

  final String message;

  @override
  String toString() => message;

  static const BaseValidationWarning none = BaseValidationWarning('');
}
