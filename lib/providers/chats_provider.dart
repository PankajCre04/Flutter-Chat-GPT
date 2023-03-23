import 'package:chat_gpt/models/chat_model.dart';
import 'package:flutter/cupertino.dart';

import '../services/api_services.dart';

class ChatProvider extends ChangeNotifier {
  List<ChatModel> chatList = [];
  List<ChatModel> get getChatList {
    return chatList;
  }

  void addUserMessage({required String msg}) {
    chatList.add(ChatModel(msg: msg, chatIndex: 0));
    notifyListeners();
  }

  Future<void> sendMessageAndGetAnswer(
      {required String msg, required String modelId}) async {
    chatList.addAll(await ApiServices.sendMessage(
      message: msg,
      modelId: modelId,
    ));
    notifyListeners();
  }
}
