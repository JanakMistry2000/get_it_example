extension IntegerExtension on int? {
  bool get isSuccessful => this == null ? false : this! >= 200 && this! <= 300;
}
