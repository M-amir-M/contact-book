import 'package:animate_do/animate_do.dart';
import 'package:contact_book/core/data/models/contact.dart';
import 'package:contact_book/core/routes/route_path.dart';
import 'package:contact_book/core/viewmodels/contacts.dart';
import 'package:contact_book/ui/common/helper.dart';
import 'package:contact_book/ui/screens/base_view.dart';
import 'package:contact_book/ui/widgets/skeleton/skeleton_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ContactListPage extends StatefulWidget {
  const ContactListPage({Key? key}) : super(key: key);

  @override
  State<ContactListPage> createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<ContactsViewModel>(onModelReady: (model) async {
      await model.getContactList();
    }, builder: (context, model, index) {
      return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Iconsax.add),
            onPressed: () {
              Get.toNamed(RoutePath.editNewCntact.replaceAll(":id", "new"));
            },
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(UIHelper.paddingLarge),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Contact",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    optionMenu(onLogout: () {
                      model.logout();
                    }),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: UIHelper.paddingLarge),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    model.filterContacts(value);
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.search_normal),
                    hintText: "Search...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(60),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: UIHelper.paddingLarge,
                    vertical: UIHelper.paddingMedium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Friends",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      "Show All",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ],
                ),
              ),
              model.isLoading
                  ? ContactListSkeleton()
                  : Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(
                          horizontal: UIHelper.paddingLarge,
                          vertical: UIHelper.paddingMedium,
                        ),
                        itemBuilder: (context, index) {
                          ContactModel contact = model.contacts[index];
                          return SlideInLeft(
                            duration: Duration(milliseconds: 150 * index),
                            child: InkWell(
                              onTap: () async {
                                await Get.toNamed(RoutePath.contactDetail
                                    .replaceAll(":id", "${contact.id}"));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: UIHelper.paddingMedium),
                                child: Row(
                                  children: [
                                    Hero(
                                      tag: "avatar-${contact.id}",
                                      child: CircleAvatar(
                                        radius: 30.0,
                                        child: contact.avatar != null
                                            ? null
                                            : Text(contact
                                                    .fullName.capitalizeFirst
                                                    ?.substring(0, 1) ??
                                                ""),
                                        backgroundImage: contact.avatar == null
                                            ? null
                                            : NetworkImage("${contact.avatar}"),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                      ),
                                    ),
                                    UIHelper.horizontalSpaceLarge,
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${contact.fullName}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge,
                                          ),
                                          Text(
                                            "${contact.phone}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: model.contacts.length,
                      ),
                    ),
            ],
          ),
        ),
      );
    });
  }

  PopupMenuButton<dynamic> optionMenu({
    Function? onLogout,
  }) {
    return PopupMenuButton(
      onSelected: (value) async {
        FocusScope.of(context).unfocus();
        switch (value) {
          case 0:
            onLogout!();
            break;
          default:
        }
      },
      color: Theme.of(context).colorScheme.onSurface,
      surfaceTintColor: Theme.of(context).colorScheme.onSurface,
      icon: Icon(
        Iconsax.more,
      ),
      padding: EdgeInsets.all(UIHelper.paddingMedium),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(UIHelper.primaryRadius),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        PopupMenuItem(
          value: 0,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(
              Iconsax.login,
              color: Colors.white,
            ),
            title: Text(
              "Logout",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      ],
    );
  }
}
