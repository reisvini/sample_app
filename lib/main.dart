import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:sample_app/contacts/bloc/contacts_bloc.dart';
import 'package:sample_app/contacts/page/contacts_list_page.dart';
import 'package:sample_app/contacts/page/upsert_contact_screen.dart';
import 'package:sample_app/core/database/database_provider_impl.dart';
import 'package:sample_app/core/model/contact_model.dart';
import 'package:sample_app/core/repository/contacts/contacts_repository_impl.dart';
import 'package:sample_app/core/routes/route_paths.dart';
import 'package:sample_app/core/utils/get_all_initial_contacts.dart';

final Logger logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (FlutterErrorDetails error) {
    logger.e(
      error.exceptionAsString(),
      error: error.exception,
      time: DateTime.now(),
      stackTrace: error.stack,
    );
  };

  final DatabaseProviderImpl databaseProvider = DatabaseProviderImpl();

  await databaseProvider.init();

  final ContactsRepositoryImpl contactsRepositoryProvider =
      ContactsRepositoryImpl(databaseProvider);

  await contactsRepositoryProvider.removeAll();

  await contactsRepositoryProvider.createAll(getAllInitialContacts());

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactsBloc(
            contactsRepository: contactsRepositoryProvider,
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Sample App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.tealAccent),
          useMaterial3: true,
        ),
        routerConfig: GoRouter(
          initialLocation: RoutePaths.contacts,
          routes: [
            GoRoute(
              path: RoutePaths.contacts,
              builder: (context, state) => const ContactsListPage(),
            ),
            GoRoute(
              path: RoutePaths.contactsUpsert,
              builder: (context, state) => UpsertContactScreen(
                contact: state.extra as ContactModel?,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
