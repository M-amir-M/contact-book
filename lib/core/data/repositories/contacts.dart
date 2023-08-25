
import 'package:contact_book/core/data/models/contact.dart';
import 'package:contact_book/core/data/models/result.dart';
import 'package:contact_book/core/locator.dart';
import 'package:contact_book/core/services/api/api_service.dart';

class ContactsRepository {
  ApiService _api = locator<ApiService>();
  List<ContactModel> _contacts = [];
  List<ContactModel> get contscts => _contacts;

  Future<Result> getContactList() async {
    var result = await _api.getContactList();
    if (result.success) {
      _contacts = List<ContactModel>.from(
        result.data.map(
          (e) => ContactModel.fromJson(e),
        ),
      );
    }
    return result;
  }

  Future<Result> createContact(ContactModel contact) async {
    var result = await _api.createContact(data: contact.toJson());
    if (result.success) {
      var newContact = ContactModel.fromJson(result.data);
      _contacts.add(newContact);
    }
    return result;
  }

  Future<Result> editContact(ContactModel contact) async {
    var result = await _api.editContact(contact.id!, data: contact.toJson());
    if (result.success) {
      int index = _contacts.indexWhere((e) => e.id == contact.id);
      _contacts[index] = contact;
    }
    return result;
  }

  Future<Result> deleteContact(ContactModel contact) async {
    var result = await _api.deleteContact(contact.id!);
    if (result.success) {
      _contacts.removeWhere((element) => element.id == contact.id);
    }
    return result;
  }
}
