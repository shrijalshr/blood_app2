import 'package:blood_app/models/chat_model.dart';
import 'package:blood_app/services/chat_service.dart';
import 'package:get/get.dart';

import '../models/single_chat_list_model.dart';

class ChatController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getMessageList();
    super.onInit();
  }

  RxBool isMessageListLoading = false.obs;
  RxList<ChatListModel> chatList = <ChatListModel>[].obs;
  Future getMessageList() async {
    ChatService service = ChatService();
    bool isSuccess = await service.getChatList();
    if (isSuccess) {
      chatList.assignAll(service.chatList);
    }
  }

  RxBool isSingleChatListLoading = false.obs;
  RxList<SingleChatListModel> singleChatList = <SingleChatListModel>[].obs;
  Future getSingleChatList(data) async {
    ChatService service = ChatService();
    bool isSuccess = await service.getSingleChatList(data);
    if (isSuccess) {
      singleChatList.assignAll(service.singleChatList);
    }
  }

  RxBool isSent = false.obs;
  Future sendMessage(data) async {
    ChatService service = ChatService();
    bool isSuccess = await service.sendMessage(data);
    isSent.value = isSuccess;
  }
}
