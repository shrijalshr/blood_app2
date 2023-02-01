import 'package:blood_app/controller/chat_controller.dart';
import 'package:blood_app/models/chat_model.dart';
import 'package:blood_app/utils/constants/app_color.dart';
import 'package:blood_app/utils/constants/app_styles.dart';
import 'package:blood_app/utils/widgets/chat_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());
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
        body: Obx(() {
          return controller.isMessageListLoading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.chatList.isEmpty
                  ? Center(child: Image.asset("assets/images/empty.jpg"))
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        final ChatListModel chat = controller.chatList[index];
                        return ChatListTile(name: chat.name ?? "", imgPath: "");
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: controller.chatList.length);
        }));
  }
}
