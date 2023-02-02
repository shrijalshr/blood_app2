import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/chat_screen.dart';
import '../constants/app_color.dart';
import '../constants/app_styles.dart';
import 'dash_container.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    Key? key,
    required this.name,
    required this.uid,
  }) : super(key: key);

  final String name;
  final int uid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ChatScreen(name: name, uid: uid));
      },
      child: DashContainer(
        padding: const EdgeInsets.all(15),
        color: AppColor.white,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                radius: 20,
                child: Text(
                  name.characters.first,
                  style: AppStyle.boldStyle(),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: AppStyle.boldStyle(),
                      ),
                    ],
                  ).pb(5),
                  // Text(
                  //   "https://www.google.com/search?q=lorem+ipsum+generator&oq=lore&aqs=edge.1.69i57j69i59j69i64.1788j0j1&sourceid=chrome&ie=UTF-8",
                  //   style: AppStyle.subLightStyle(),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
