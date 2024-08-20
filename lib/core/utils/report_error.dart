import 'package:flutter/material.dart';

FlutterErrorDetails handleError({
  required Object e,
  required StackTrace stack,
  required String library,
  required String message,
}) {
  final FlutterErrorDetails error = FlutterErrorDetails(
    exception: e,
    stack: stack,
    library: library,
    context: ErrorDescription(message),
  );

  FlutterError.reportError(error);

  return error;
}
