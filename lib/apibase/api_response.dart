class APIResponse<T> {
  const APIResponse({
    this.message,
    this.data,
    this.code,
  });

  final int? code;

  final T? data;

  final String? message;
}
