class ApiPath {
  //private constructor
  ApiPath._();

  //domain......................................................................

  static const String baseUrl = 'https://contacts-df29.restdb.io/rest';

  //path........................................................................

  // Auth
  static const String signin = '/auth/signup';

  // Contacts
  static const String contactList = '/contacts';
  static const String createContact = '/contacts';
  static const String editContact = '/contacts/{id}';
  static const String deleteContact = '/contacts/{id}';
}
