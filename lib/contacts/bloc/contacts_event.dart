part of 'contacts_bloc.dart';

sealed class ContactsEvent {
  const ContactsEvent();
}

class AddContact extends ContactsEvent {
  final ContactModel contact;
  const AddContact({required this.contact});
}

class UpdateContact extends ContactsEvent {
  final ContactModel contact;
  const UpdateContact({required this.contact});
}

class DeleteContact extends ContactsEvent {
  final ContactModel contact;
  const DeleteContact({required this.contact});
}

class GetAllContacts extends ContactsEvent {
  const GetAllContacts();
}
