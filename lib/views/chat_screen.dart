import 'package:blood_app/utils/constants/app_color.dart';
import 'package:blood_app/utils/constants/app_styles.dart';
import 'package:blood_app/utils/helper/custom_extensions.dart';
import 'package:blood_app/utils/widgets/my_textfield.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text(
          "Rominey Basnet",
          style: AppStyle.headingStyle(color: AppColor.darkPrimary),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColor.darkPrimary),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SenderChatTile().pb(15),
                const SelfChatTile(),
              ],
            ).pa(15),
            const SendMessageTile()
          ],
        ),
      ),
    );
  }
}

class SendMessageTile extends StatelessWidget {
  const SendMessageTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: const MyTextField(
            label: "",
            hintText: "Message",
            maxLines: null,
          ).pl(15),
        ),
        Expanded(
            child: IconButton(
          icon: const Icon(
            Icons.send,
            color: AppColor.darkBlue,
          ),
          onPressed: () {},
        ))
      ],
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

class SenderChatTile extends StatelessWidget {
  const SenderChatTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
                backgroundImage: AssetImage("assets/images/completed.jpg"),
                radius: 16)
            .pr(15),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(8),
                )),
            child: const Text(
              "Reloaded 8 of 1451 libraries in 800ms (compile: 92 ms, reload: 237 ms, reassemble: 423 ms).",
              maxLines: 2,
            ),
          ),
        )
      ],
    );
  }
}
