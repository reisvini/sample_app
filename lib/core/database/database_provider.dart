import 'package:sample_app/core/model/result.dart';

abstract class DatabaseProvider {
  Future<void> init();
  Future<Result<T>> create<T>(T arg);
  Future<Result<bool>> delete<T>(int id);
  Future<Result<T>> update<T>(T arg);
  Future<Result<T?>> readOne<T>(int id);
  Future<Result<List<T>>> readAll<T>();
}
