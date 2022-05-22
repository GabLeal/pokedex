import 'package:flutter/foundation.dart';

@immutable
class HttpResponse {
  final dynamic body;
  final int statusCode;
  final String url;

  const HttpResponse({
    required this.body,
    required this.statusCode,
    required this.url,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HttpResponse &&
        other.body == body &&
        other.statusCode == statusCode &&
        other.url == url;
  }

  @override
  int get hashCode => body.hashCode ^ statusCode.hashCode ^ url.hashCode;
}
