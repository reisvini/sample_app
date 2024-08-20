import 'package:flutter/material.dart';
import 'package:sample_app/core/database/database_provider_impl.dart';
import 'package:sample_app/core/model/contact_model.dart';
import 'package:sample_app/core/model/result.dart';
import 'package:sample_app/core/repository/contacts/contacts_repository.dart';
import 'package:sample_app/core/utils/report_error.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  final DatabaseProviderImpl _database;

  ContactsRepositoryImpl(this._database);

  @override
  Future<Result<ContactModel>> create(ContactModel contact) async {
    try {
      return await _database.create<ContactModel>(contact);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to create contact: $contact',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<bool>> delete(int id) async {
    try {
      return await _database.delete<ContactModel>(id);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to delete contact with id: $id',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<ContactModel>> update(ContactModel contact) async {
    try {
      return await _database.update<ContactModel>(contact);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to update contact: $contact',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<ContactModel?>> getOne(int id) async {
    try {
      return await _database.getOne<ContactModel>(id);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to read contact with id: $id',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<List<ContactModel>>> getAll() async {
    try {
      return await _database.getAll<ContactModel>();
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to read all contacts',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<int>> removeAll() async {
    try {
      return await _database.removeAll<ContactModel>();
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to remove all contacts',
      );

      return Result.failure(error);
    }
  }

  @override
  Future<Result<List<ContactModel>>> createAll(
      List<ContactModel> contacts) async {
    try {
      return await _database.createAll<ContactModel>(contacts);
    } catch (e, stack) {
      final FlutterErrorDetails error = handleError(
        e: e,
        stack: stack,
        library: 'lib/core/database/database_provider_impl.dart',
        message: 'Failed to create contact: $contacts',
      );

      return Result.failure(error);
    }
  }
}
