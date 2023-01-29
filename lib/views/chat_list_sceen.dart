import 'package:blood_app/utils/constants/app_color.dart';
import 'package:blood_app/utils/constants/app_styles.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/widgets/dash_container.dart';
import 'package:blood_app/views/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        title: Text(
          "Chats",
          style: AppStyle.headingStyle(
            color: AppColor.darkPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.white,
        iconTheme: const IconThemeData(
          color: AppColor.darkPrimary,
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const ChatListTile().pb(10),
        ],
      ).pa(10)),
    );
  }
}

class ChatListTile extends StatelessWidget {
  const ChatListTile({
    Key? key,
  }) : super(key: key);

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
                radius: 28,
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
                        "Rominey Basnet",
                        style: AppStyle.boldStyle(),
                      ),
                      Text(
                        "2 mins ago",
                        style: AppStyle.subLightStyle(),
                      ),
                    ],
                  ).pb(5),
                  Text(
                    "https://www.google.com/search?q=lorem+ipsum+generator&oq=lore&aqs=edge.1.69i57j69i59j69i64.1788j0j1&sourceid=chrome&ie=UTF-8",
                    style: AppStyle.subLightStyle(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
