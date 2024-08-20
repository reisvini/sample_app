import 'package:flutter/material.dart';
import 'package:sample_app/core/database/database_provider.dart';
import 'package:sample_app/core/database/object_box.dart';
import 'package:sample_app/core/model/result.dart';
import 'package:sample_app/core/utils/report_error.dart';
import 'package:sample_app/objectbox.g.dart';

class DatabaseProviderImpl implements DatabaseProvider {
  late final ObjectBox _instance;

  Store get _store => _instance.store;

  @override
  Future<void> init() async {
    _instance = await ObjectBox.create();
  }

  @override
  Future<Result<T>> create<T>(T arg) async {
    try {
      final result =
          await _store.box<T>().putAndGetAsync(arg, mode: PutMode.put);
      return Result.success(result);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to create record: $e',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<bool>> delete<T>(int id) async {
    try {
      final result = await _store.box<T>().removeAsync(id);
      return Result.success(result);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to delete record: $id',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<T?>> getOne<T>(int id) async {
    try {
      final result = await _store.box<T>().getAsync(id);
      return Result.success(result);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to read one record: $id',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<List<T>>> getAll<T>() async {
    try {
      final result = await _store.box<T>().getAllAsync();
      return Result.success(result);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to read all records of type: $T',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<T>> update<T>(T arg) async {
    try {
      final result =
          await _store.box<T>().putAndGetAsync(arg, mode: PutMode.put);
      return Result.success(result);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to update record: $arg',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<int>> removeAll<T>() async {
    try {
      final result = await _store.box<T>().removeAllAsync();
      return Result.success(result);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to remove all records of type: $T',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<List<T>>> createAll<T>(List<T> args) async {
    try {
      final result = await _store.box<T>().putAndGetManyAsync(args);
      return Result.success(result);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to create all records of type: $T',
      );

      return Result.failure(error);
    }
  }
}
