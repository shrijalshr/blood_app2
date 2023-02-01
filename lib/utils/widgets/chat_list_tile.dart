import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:flutter/material.dart';

import '../../views/chat_screen.dart';
import '../constants/app_color.dart';
import '../constants/app_styles.dart';
import 'dash_container.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    Key? key,
    required this.name,
    required this.imgPath,
  }) : super(key: key);

  final String name;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChatScreen()));
      },
      child: DashContainer(
        padding: const EdgeInsets.all(15),
        color: AppColor.white,
        child: Row(
          children: [
            const Expanded(
              flex: 1,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/completed.jpg"),
                radius: 20,
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
                      Text(
                        "2 mins ago",
                        style: AppStyle.subLightStyle(),
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
