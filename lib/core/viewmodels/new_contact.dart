import 'package:contact_book/core/data/models/contact.dart';
import 'package:contact_book/core/data/repositories/contacts.dart';
import 'package:contact_book/core/enums/network_state.dart';
import 'package:contact_book/core/locator.dart';
import 'package:contact_book/core/routes/route_path.dart';
import 'package:contact_book/core/utils/toast.dart';
import 'package:contact_book/core/viewmodels/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class NewContactViewModel extends BaseViewModel {
  ContactsRepository _contactsRepo = locator<ContactsRepository>();

  ContactModel? contact = ContactModel();

  Future getContactDetail(String id) async {
    contact = _contactsRepo.contscts.firstWhereOrNull((c) => c.id == id);
    notifyListeners();
  }

  Future editContact() async {
    setState(NetworkState.BUSY);
    var result = await _contactsRepo.editContact(contact!);
    if (result.success) {
      Get.offNamedUntil(
          RoutePath.contactDetail.replaceAll(":id", "${contact?.id}"),
          ModalRoute.withName(RoutePath.contactList));
      setState(NetworkState.COMPLETE);
    } else {
      ToastUtil.showErrorToast(message: result.parseAllErrors().message);
      setState(NetworkState.ERROR);
    }
    notifyListeners();
  }

  Future createContact() async {
    setState(NetworkState.BUSY);
    var result = await _contactsRepo.createContact(contact!);
    if (result.success) {
      Get.offNamedUntil(RoutePath.contactList, (Route route) => false);

      setState(NetworkState.COMPLETE);
    } else {
      ToastUtil.showErrorToast(message: result.parseAllErrors().message);
      setState(NetworkState.ERROR);
    }
    notifyListeners();
  }
}
