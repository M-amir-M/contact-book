import 'package:contact_book/ui/common/helper.dart';
import 'package:contact_book/ui/widgets/skeleton/skeleton_tools.dart';
import 'package:flutter/material.dart';

class ContactListSkeleton extends StatelessWidget {
  const ContactListSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(UIHelper.paddingLarge),
            child: LineSkeleton(
              width: 50,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: UIHelper.paddingLarge),
            child: LineSkeleton(
              borderRadius: 50,
              height: 45,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: UIHelper.paddingLarge,
                vertical: UIHelper.paddingLarge),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LineSkeleton(
                  width: 70,
                ),
                LineSkeleton(
                  width: 30,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: UIHelper.paddingLarge,
                vertical: UIHelper.paddingMedium,
              ),
              itemBuilder: (context, index) {
                return LineSkeleton(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 60,
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
