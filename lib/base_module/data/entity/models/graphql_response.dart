import 'error_info.dart';

class GraphQLResponse {
  final ErrorInfo? error;
  final dynamic data;

  bool get hasData => data != null;

  bool get hasError => error != null;

  GraphQLResponse({
    this.error,
    this.data,
  });
}
