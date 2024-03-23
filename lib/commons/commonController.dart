import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodbye_frontend/commons/url.dart';

class CommonController extends GetxController {
  int seq = 0;
  String targetName = '우리 엄마';
  int targetDday = 0;
  final GetConnect _getConnect = GetConnect(timeout: Duration(seconds: 60));

  List<dynamic> chattingList = [];

  Future<dynamic> sendChat(int targetSeq, String chat) async {
    final response = await _getConnect.post("${API_URL}/target/chat", {
      'seq': targetSeq,
      'dday' : targetDday,
      'chat': chat,
    });
    print("!@#!@#!@#");
    if (response.statusCode == 200) {
      print("!!0");
      
      dynamic data = jsonDecode(response.bodyString!);
      
      chattingList.add({
        // "seq": controller.seq,
        "user" : "you",
        "chat": data['receivedChat'],
        "date": DateTime.now().toString()
      });
      print(chattingList);
      update();

      return {
        // "seq": controller.seq,
        "user" : "you",
        "chat": data['receivedChat'],
        "date": DateTime.now().toString()
      };
    }
  }
}
