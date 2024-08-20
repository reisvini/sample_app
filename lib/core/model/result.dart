import 'package:flutter/material.dart';

class Result<T> {
  final T? value;
  final FlutterErrorDetails? exception;

  Result.success(this.value) : exception = null;
  Result.failure(this.exception) : value = null;
}
