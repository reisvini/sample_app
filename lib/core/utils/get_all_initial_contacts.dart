import 'package:sample_app/core/model/contact_model.dart';

const List<Map<String, dynamic>> contactsJson = [
  {
    "contactID": "e3b0c442-98fc-4621-a935-ecd56f98d567",
    "firstName": "John",
    "lastName": "Doe",
    "phoneNumber": "555-123-4567",
    "streetAddress1": "123 Elm St",
    "streetAddress2": "Apt 4B",
    "city": "Springfield",
    "state": "IL",
    "zipCode": "62704"
  },
  {
    "contactID": "b7c1fcf7-421b-4c72-bfed-cdbf65f8142b",
    "firstName": "Jane",
    "lastName": "Smith",
    "phoneNumber": "555-987-6543",
    "streetAddress1": "456 Maple Ave",
    "streetAddress2": "",
    "city": "Columbus",
    "state": "OH",
    "zipCode": "43215"
  },
  {
    "contactID": "a14c53ed-17d6-4d91-bd3c-b5f6361c1b58",
    "firstName": "Alice",
    "lastName": "Johnson",
    "phoneNumber": "555-222-3344",
    "streetAddress1": "789 Oak Blvd",
    "streetAddress2": "Suite 201",
    "city": "Austin",
    "state": "TX",
    "zipCode": "78701"
  },
  {
    "contactID": "f29bfa29-97f8-43fa-812d-e43e6b8b94b7",
    "firstName": "Bob",
    "lastName": "Brown",
    "phoneNumber": "555-333-1122",
    "streetAddress1": "321 Pine Rd",
    "streetAddress2": "Apt 2A",
    "city": "Phoenix",
    "state": "AZ",
    "zipCode": "85001"
  },
  {
    "contactID": "da1b3b5e-ccf7-4b71-9c5e-e342d8b5a6e7",
    "firstName": "Carol",
    "lastName": "Williams",
    "phoneNumber": "555-444-2233",
    "streetAddress1": "654 Birch Ln",
    "streetAddress2": "",
    "city": "Nashville",
    "state": "TN",
    "zipCode": "37203"
  },
  {
    "contactID": "c71dbf44-4e8f-46c4-9f93-9180dc8369f2",
    "firstName": "David",
    "lastName": "Jones",
    "phoneNumber": "555-555-3344",
    "streetAddress1": "987 Cedar St",
    "streetAddress2": "",
    "city": "Denver",
    "state": "CO",
    "zipCode": "80202"
  },
  {
    "contactID": "5b16fa7f-7354-4c16-9b1b-e0d7a5fa32d2",
    "firstName": "Emily",
    "lastName": "Taylor",
    "phoneNumber": "555-666-4455",
    "streetAddress1": "159 Spruce Dr",
    "streetAddress2": "Apt 5C",
    "city": "Seattle",
    "state": "WA",
    "zipCode": "98101"
  },
  {
    "contactID": "8c30e7b6-1189-4b0d-b1a8-f12e7b4bb4f4",
    "firstName": "Frank",
    "lastName": "Miller",
    "phoneNumber": "555-777-5566",
    "streetAddress1": "753 Fir St",
    "streetAddress2": "",
    "city": "Boston",
    "state": "MA",
    "zipCode": "02108"
  },
  {
    "contactID": "d7e8e3f4-50c8-4f17-9189-1f0f7e4ab1b7",
    "firstName": "Grace",
    "lastName": "Anderson",
    "phoneNumber": "555-888-6677",
    "streetAddress1": "258 Willow Ln",
    "streetAddress2": "Apt 3B",
    "city": "Miami",
    "state": "FL",
    "zipCode": "33101"
  },
  {
    "contactID": "3b07ef3e-5a6e-43d1-9173-bc31d8a9d9c3",
    "firstName": "Henry",
    "lastName": "Wilson",
    "phoneNumber": "555-999-7788",
    "streetAddress1": "951 Redwood Rd",
    "streetAddress2": "Suite 101",
    "city": "Los Angeles",
    "state": "CA",
    "zipCode": "90001"
  }
];

List<ContactModel> getAllInitialContacts() {
  return contactsJson.map((e) => ContactModel.fromJson(e)).toList();
}
