class ArgumentException extends FormatException {
  /// Команда, во время обработки которой произошла ошибка.
  final String? command;

  /// Имя аргумента, вызвавшего ошибку.
  final String? argumentName;

  ArgumentException(
    super.message, [
    this.command,
    this.argumentName,
    super.source,
    super.offset,
  ]);

  @override
  String toString() {
    return 'ArgumentException: $message';
  }
}