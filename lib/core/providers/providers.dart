import 'package:sample_app/core/database/database_provider_impl.dart';
import 'package:sample_app/core/repository/contacts/contacts_repository_impl.dart';

final DatabaseProviderImpl databaseProvider = DatabaseProviderImpl();
final ContactsRepositoryImpl contactsRepository =
    ContactsRepositoryImpl(databaseProvider);
