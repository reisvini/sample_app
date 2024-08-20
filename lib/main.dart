import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:sample_app/core/routes/route_paths.dart';
import 'package:sample_app/pages/contacts/contacts_list_screen.dart';
import 'package:sample_app/contacts/contacts/upsert_contact_screen.dart';

void main() {
  final Logger logger = Logger();

  FlutterError.onError = (FlutterErrorDetails error) {
    logger.e(
      error.exceptionAsString(),
      error: error.exception,
      time: DateTime.now(),
      stackTrace: error.stack,
    );
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
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
            builder: (context, state) => const UpsertContactScreen(),
          ),
        ],
      ),
    );
  }
}
