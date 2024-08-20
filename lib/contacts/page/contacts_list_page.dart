import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/contacts/bloc/contacts_bloc.dart';
import 'package:sample_app/core/model/contact_model.dart';
import 'package:sample_app/core/routes/route_paths.dart';

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
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          if (state.status == ContactsStatus.failure) {
            return Center(
              child: TextButton(
                onPressed: () {
                  context.read<ContactsBloc>().add(const GetAllContacts());
                },
                child: const Text('Try Again'),
              ),
            );
          }

          return ListView.builder(
            itemCount: state.contacts.length,
            itemBuilder: (context, index) {
              final ContactModel contact = state.contacts[index];

              return ListTile(
                title: Text('${contact.firstName} ${contact.lastName}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone: ${contact.phoneNumber}'),
                    Text(
                        'Address: ${contact.streetAddress1} ${contact.streetAddress2}'),
                    Text('City: ${contact.city}'),
                    Text('State: ${contact.state}'),
                    Text('Zip Code: ${contact.zipCode}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        context.push(
                          RoutePaths.contactsUpsert,
                          extra: contact,
                        );
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<ContactsBloc>().add(
                              DeleteContact(
                                contact: contact,
                              ),
                            );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
