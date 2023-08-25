import 'package:contact_book/core/data/models/contact.dart';
import 'package:contact_book/core/data/repositories/contacts.dart';
import 'package:contact_book/core/enums/network_state.dart';
import 'package:contact_book/core/locator.dart';
import 'package:contact_book/core/routes/route_path.dart';
import 'package:contact_book/core/utils/toast.dart';
import 'package:contact_book/core/viewmodels/base_view_model.dart';
import 'package:get/get.dart';

class ContactDetailViewModel extends BaseViewModel {
  ContactsRepository _contactsRepo = locator<ContactsRepository>();

  ContactModel? _contact;
  ContactModel? get contact => _contact;

  Future getContactDetail(String id) async {
    _contact = _contactsRepo.contscts.firstWhereOrNull((c) => c.id == id);
    notifyListeners();
  }

  Future deleteContact() async {
    setState(NetworkState.BUSY);
    var result = await _contactsRepo.deleteContact(contact!);
    if (result.success) {
      Get.offNamed(RoutePath.contactList);
      setState(NetworkState.COMPLETE);
    } else {
      ToastUtil.showErrorToast(message: result.parseAllErrors().message);
      setState(NetworkState.ERROR);
    }
    notifyListeners();
  }
}
