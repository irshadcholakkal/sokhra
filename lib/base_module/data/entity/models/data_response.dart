class DataResponse {
  final String? error;
  final dynamic data;

  bool get hasData => data != null;

  bool get hasError => error != null;

  DataResponse({
    this.error,
    this.data,
  });
}
