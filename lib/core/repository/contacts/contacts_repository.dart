import 'package:sample_app/core/model/contact_model.dart';
import 'package:sample_app/core/model/result.dart';

abstract class ContactsRepository {
  Future<Result<ContactModel>> create(ContactModel contact);
  Future<Result<List<ContactModel>>> createAll(List<ContactModel> contacts);

  Future<Result<bool>> delete(int id);

  Future<Result<ContactModel>> update(ContactModel contact);

  Future<Result<ContactModel?>> getOne(int id);

  Future<Result<List<ContactModel>>> getAll();
  Future<Result<int>> removeAll();
}
