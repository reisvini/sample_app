import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_app/contacts/bloc/contacts_bloc.dart';
import 'package:sample_app/core/model/contact_model.dart';
import 'package:uuid/uuid.dart';

class UpsertContactScreen extends StatefulWidget {
  final ContactModel? contact;
  const UpsertContactScreen({super.key, this.contact});

  @override
  State<UpsertContactScreen> createState() => _UpsertContactScreenState();
}

class _UpsertContactScreenState extends State<UpsertContactScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _streetAddress1Controller;
  late TextEditingController _streetAddress2Controller;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _zipCodeController;

  @override
  void initState() {
    _firstNameController =
        TextEditingController(text: widget.contact?.firstName ?? '');
    _lastNameController =
        TextEditingController(text: widget.contact?.lastName ?? '');
    _phoneNumberController =
        TextEditingController(text: widget.contact?.phoneNumber ?? '');
    _streetAddress1Controller =
        TextEditingController(text: widget.contact?.streetAddress1 ?? '');
    _streetAddress2Controller =
        TextEditingController(text: widget.contact?.streetAddress2 ?? '');
    _cityController = TextEditingController(text: widget.contact?.city ?? '');
    _stateController = TextEditingController(text: widget.contact?.state ?? '');
    _zipCodeController =
        TextEditingController(text: widget.contact?.zipCode ?? '');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upsert Contact'),
      ),
      body: BlocBuilder<ContactsBloc, ContactsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  TextFormField(
                    controller: _firstNameController,
                    decoration: const InputDecoration(labelText: 'First Name'),
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    decoration: const InputDecoration(labelText: 'Last Name'),
                  ),
                  TextFormField(
                    controller: _phoneNumberController,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
                  ),
                  TextFormField(
                    controller: _streetAddress1Controller,
                    decoration:
                        const InputDecoration(labelText: 'Street Address 1'),
                  ),
                  TextFormField(
                    controller: _streetAddress2Controller,
                    decoration:
                        const InputDecoration(labelText: 'Street Address 2'),
                  ),
                  TextFormField(
                    controller: _cityController,
                    decoration: const InputDecoration(labelText: 'City'),
                  ),
                  TextFormField(
                    controller: _stateController,
                    decoration: const InputDecoration(labelText: 'State'),
                  ),
                  TextFormField(
                    controller: _zipCodeController,
                    decoration: const InputDecoration(labelText: 'Zip Code'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _formKey.currentState?.save();

                        final ContactModel newContact = ContactModel(
                          id: widget.contact?.id,
                          contactID:
                              widget.contact?.contactID ?? const Uuid().v4(),
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          phoneNumber: _phoneNumberController.text,
                          streetAddress1: _streetAddress1Controller.text,
                          streetAddress2: _streetAddress2Controller.text,
                          city: _cityController.text,
                          state: _stateController.text,
                          zipCode: _zipCodeController.text,
                        );

                        context.read<ContactsBloc>().add(
                              widget.contact != null
                                  ? UpdateContact(
                                      contact: newContact,
                                    )
                                  : AddContact(
                                      contact: newContact,
                                    ),
                            );

                        context.pop();
                      },
                      icon: const Icon(Icons.save),
                      label: const Text('Save'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
