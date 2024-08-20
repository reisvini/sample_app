part of 'contacts_bloc.dart';

enum ContactsStatus { loading, success, failure }

final class ContactsState {
  const ContactsState({
    this.status = ContactsStatus.loading,
    this.contacts = const [],
  });

  final ContactsStatus status;
  final List<ContactModel> contacts;

  ContactsState copyWith({
    ContactsStatus? status,
    List<ContactModel>? contacts,
  }) {
    return ContactsState(
      status: status ?? this.status,
      contacts: contacts ?? this.contacts,
    );
  }
}
