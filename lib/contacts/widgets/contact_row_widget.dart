import 'package:flutter/material.dart';
import 'package:sample_app/core/model/contact_model.dart';

class ContactRowWidget extends StatelessWidget {
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ContactModel contact;

  const ContactRowWidget({
    super.key,
    required this.onEdit,
    required this.onDelete,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${contact.firstName} ${contact.lastName}'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Phone: ${contact.phoneNumber}'),
          Text('Address: ${contact.streetAddress1} ${contact.streetAddress2}'),
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
            onPressed: onEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }
}
