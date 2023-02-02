import 'package:blood_app/controller/chat_controller.dart';
import 'package:blood_app/models/single_chat_list_model.dart';
import 'package:blood_app/utils/constants/app_color.dart';
import 'package:blood_app/utils/constants/app_styles.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.name, required this.uid});

  final String name;
  final int uid;

  @override
  Widget build(BuildContext context) {
    final ChatController controller = Get.put(ChatController());
    controller.getSingleChatList(uid);
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text(
          name,
          style: AppStyle.headingStyle(color: AppColor.darkPrimary),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.darkPrimary),
      ),
      body: SizedBox(
        height: 100.fh,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Positioned(
              bottom: 80,
              top: 0,
              right: 0,
              left: 0,
              child: Obx(
                () => controller.isSingleChatListLoading.value
                    ? const CircularProgressIndicator()
                    : controller.singleChatList.isEmpty
                        ? SingleChildScrollView(
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/empty.jpg",
                                  width: 100.fw,
                                ),
                                Text(
                                  "No messages to display.",
                                  style: AppStyle.boldStyle(),
                                ).pv(20),
                              ],
                            ),
                          )
                        : ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              final SingleChatListModel singleChat =
                                  controller.singleChatList[index];
                              return ChatTile(
                                name: singleChat.senderName ?? "",
                                message: singleChat.message ?? "",
                              ).p(15, 15, 10, 10);
                            },
                            separatorBuilder: ((context, index) =>
                                const Divider()),
                            itemCount: controller.singleChatList.length),
              ),
            ),
            SendMessageTile(
              id: uid,
              controller: controller,
            ).pb(15)
          ],
        ),
      ),
    );
  }
}

class SendMessageTile extends StatefulWidget {
  const SendMessageTile({
    Key? key,
    required this.controller,
    required this.id,
  }) : super(key: key);
  final ChatController controller;
  final int id;

  @override
  State<SendMessageTile> createState() => _SendMessageTileState();
}

class _SendMessageTileState extends State<SendMessageTile> {
  late TextEditingController messageController;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.fw,
      height: 50,
      child: Row(
        children: [
          Expanded(
            flex: 6,
            child: Form(
              key: formKey,
              child: MyTextField(
                textController: messageController,
                validator: (value) {
                  if (value == null || value.trim() == "") {
                    return "Please type message before sending.";
                  }
                  return null;
                },
                hintText: "Message",
                autoFocus: true,
                inputType: TextInputType.text,
              ).pl(15),
            ),
          ),
          Expanded(
              child: IconButton(
            icon: const Icon(
              Icons.send,
              color: AppColor.darkBlue,
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                var data = {'to_id': widget.id, 'msg': messageController.text};
                widget.controller.sendMessage(data);
                if (widget.controller.isSent.value) {
                  messageController.clear();
                  widget.controller.getSingleChatList(widget.id);
                }
              }
            },
          ))
        ],
      ),
    );
  }
}

class SelfChatTile extends StatelessWidget {
  const SelfChatTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(0),
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )),
      child: const Text(
        "Reloaded 8 of 1451 libraries in 800ms (compile: 92 ms, reload: 237 ms, reassemble: 423 ms).",
        maxLines: 2,
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key? key,
    required this.message,
    required this.name,
  }) : super(key: key);
  final String message;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppStyle.subBoldStyle(),
        ),
        Row(
          children: [
            // const CircleAvatar(
            //         backgroundImage: AssetImage("assets/images/completed.jpg"),
            //         radius: 16)
            //     .pr(15),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  message,
                  maxLines: null,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
