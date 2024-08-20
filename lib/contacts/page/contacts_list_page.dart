import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/contacts/bloc/contacts_bloc.dart';
import 'package:sample_app/contacts/widgets/contact_row_widget.dart';
import 'package:sample_app/core/model/contact_model.dart';
import 'package:sample_app/core/routes/route_paths.dart';
import 'package:sample_app/core/widget/loading_widget.dart';
import 'package:sample_app/core/widget/try_again_widget.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ContactsListScreen'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(RoutePaths.contactsUpsert);
        },
        child: const Icon(Icons.plus_one),
      ),
      body: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          if (state.status == ContactsStatus.loading) {
            return const LoadingWidget();
          }

          if (state.status == ContactsStatus.failure) {
            return TryAgainWidget(
              onTap: () {
                context.read<ContactsBloc>().add(const GetAllContacts());
              },
            );
          }

          return ListView.builder(
            itemCount: state.contacts.length,
            itemBuilder: (context, index) {
              final ContactModel contact = state.contacts[index];

              return ContactRowWidget(
                onEdit: () {
                  context.push(
                    RoutePaths.contactsUpsert,
                    extra: contact,
                  );
                },
                onDelete: () {
                  context.read<ContactsBloc>().add(
                        DeleteContact(
                          contact: contact,
                        ),
                      );
                },
                contact: contact,
              );
            },
          );
        },
      ),
    );
  }
}
