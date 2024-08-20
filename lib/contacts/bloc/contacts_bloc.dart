import 'package:bloc/bloc.dart';
import 'package:sample_app/core/model/contact_model.dart';
import 'package:sample_app/core/model/result.dart';
import 'package:sample_app/core/repository/contacts/contacts_repository.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  ContactsBloc({
    required ContactsRepository contactsRepository,
  })  : _contactsRepository = contactsRepository,
        super(const ContactsState()) {
    on<AddContact>(_onAddContact);
    on<UpdateContact>(_onUpdateContact);
    on<DeleteContact>(_onDeleteContact);
    on<GetAllContacts>(_onGetAllContact);

    add(const GetAllContacts());
  }

  final ContactsRepository _contactsRepository;

  Future<void> _onAddContact(
    AddContact event,
    Emitter<ContactsState> emit,
  ) async {
    await _contactsRepository.create(event.contact);

    add(const GetAllContacts());
  }

  Future<void> _onUpdateContact(
    UpdateContact event,
    Emitter<ContactsState> emit,
  ) async {
    await _contactsRepository.update(event.contact);

    add(const GetAllContacts());
  }

  Future<void> _onDeleteContact(
    DeleteContact event,
    Emitter<ContactsState> emit,
  ) async {
    if (event.contact.id == null) return;

    await _contactsRepository.delete(event.contact.id!);

    add(const GetAllContacts());
  }

  Future<void> _onGetAllContact(
    GetAllContacts event,
    Emitter<ContactsState> emit,
  ) async {
    emit(state.copyWith(status: ContactsStatus.loading));

    final Result<List<ContactModel>> result =
        await _contactsRepository.getAll();

    if (result.isFailure) {
      emit(state.copyWith(status: ContactsStatus.failure));

      return;
    }

    emit(
      state.copyWith(
        contacts: result.value,
        status: ContactsStatus.success,
      ),
    );
  }
}
