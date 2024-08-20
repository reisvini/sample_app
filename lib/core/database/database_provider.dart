import 'package:sample_app/core/model/result.dart';

abstract class DatabaseProvider {
  Future<void> init();
  Future<Result<T>> create<T>(T arg);
  Future<Result<List<T>>> createAll<T>(List<T> args);
  Future<Result<bool>> delete<T>(int id);
  Future<Result<T>> update<T>(T arg);
  Future<Result<T?>> getOne<T>(int id);
  Future<Result<List<T>>> getAll<T>();
  Future<Result<int>> removeAll<T>();
}
