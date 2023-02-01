import 'dart:convert';

import 'package:blood_app/models/chat_model.dart';
import 'package:blood_app/models/single_chat_list_model.dart';
import 'package:blood_app/utils/helper/api.dart';

import '../utils/helper/global_functions.dart';

class ChatService {
  List<ChatListModel> chatList = [];
  List<SingleChatListModel> singleChatList = [];
  Future<bool> getChatList() async {
    bool res = await Network().getAuthData("/chats").then((res) {
      if (res != null) {
        print("Res from Chat List-->> $res");
        if (res.statusCode == 200) {
          List body = jsonDecode(res.body);
          for (var e in body) {
            ChatListModel chatListModel = ChatListModel();
            chatListModel = ChatListModel.fromJson(e);
            chatList.add(chatListModel);
          }
          return true;
        } else if (res.statusCode == 401) {
          errorSnackbar("Invalid Username/Password",
              "Username or password did not match. Try again");
          return false;
        } else if (res.statusCode == 400) {
          errorSnackbar(
              "Invalid Login", "Please provide valid email/password.");
          return false;
        } else {
          errorSnackbar("Something went wrong", "Please try again later");
          return false;
        }
      } else {
        return false;
      }
    });
    return res;
  }

  Future<bool> getSingleChatList(data) async {
    bool res = await Network().postAuthData(data, "/chats/single").then((res) {
      if (res.statusCode == 200) {
        List body = jsonDecode(res.body);
        for (var e in body) {
          SingleChatListModel singleChatListModel = SingleChatListModel();
          singleChatListModel = SingleChatListModel.fromJson(e);
          singleChatList.add(singleChatListModel);
        }
        return true;
      } else if (res.statusCode == 401) {
        errorSnackbar("Invalid Username/Password",
            "Username or password did not match. Try again");
        return false;
      } else if (res.statusCode == 400) {
        errorSnackbar("Invalid Login", "Please provide valid email/password.");
        return false;
      } else {
        errorSnackbar("Something went wrong", "Please try again later");
        return false;
      }
    });
    return res;
  }

  Future<bool> sendMessage(data) async {
    bool res = await Network().postAuthData(data, "/chats/add").then((res) {
      if (res.statusCode == 200) {
        List body = jsonDecode(res.body);
        for (var e in body) {
          SingleChatListModel singleChatListModel = SingleChatListModel();
          singleChatListModel = SingleChatListModel.fromJson(e);
          singleChatList.add(singleChatListModel);
        }
        return true;
      } else if (res.statusCode == 401) {
        errorSnackbar("Invalid Username/Password",
            "Username or password did not match. Try again");
        return false;
      } else if (res.statusCode == 400) {
        errorSnackbar("Invalid Login", "Please provide valid email/password.");
        return false;
      } else {
        errorSnackbar("Something went wrong", "Please try again later");
        return false;
      }
    });
    return res;
  }
}
