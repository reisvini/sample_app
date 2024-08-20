import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample_app/core/repository/contacts/contacts_repository_impl.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => BlocProvider(
        create: (context) => EditTodoBloc(
          todosRepository: context.read<ContactsRepositoryImpl>(),
        ),
        child: const EditTodoPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactsListScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ContactsListScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
