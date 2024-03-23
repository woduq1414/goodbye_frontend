import 'dart:typed_data';

import 'package:date_field/date_field.dart';
import 'package:flutter/scheduler.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:goodbye_frontend/commons/color.dart';
import 'package:goodbye_frontend/commons/commonController.dart';
import 'package:goodbye_frontend/widgets/BottomButton.dart';
import 'dart:typed_data';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key, this.seq});

  final int? seq;

  @override
  State<ChattingPage> createState() => _ChattingState(
        seq: seq,
      );
}

class _ChattingState extends State<ChattingPage> {
  _ChattingState({this.seq});

  int? seq;

  String _chat = "";

  dynamic _chattingList = [];

  ScrollController _scrollController = ScrollController();

  late TextEditingController myController;

  @override
  void initState() {
    super.initState();
    myController = TextEditingController(text: _chat);
    myController.addListener(() {
      setState(() {
        _chat = myController.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommonController());

    SchedulerBinding.instance!.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Column(children: [
            Text(controller.targetName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            Text("D+" + controller.targetDday.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold))
          ]),
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: Container(
              width: 390,
              color: Color(0xFFF1F0F5),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          controller: _scrollController,
                          itemCount: _chattingList.length,
                          itemBuilder: ((context, index) {
                            dynamic chat = _chattingList[index];

                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: chat["user"] == "me"
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: chat["user"] == "me"
                                            ? primaryColor
                                            : Colors.white,
                                        borderRadius: chat["user"] == "me"
                                            ? BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomLeft: Radius.circular(10),
                                              )
                                            : BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10),
                                              )),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Text(
                                        //   chat["user"] == "me"
                                        //       ? "나"
                                        //       : controller.targetName,
                                        //   style: TextStyle(
                                        //       color: chat["user"] == "me"
                                        //           ? Colors.white
                                        //           : Colors.black,
                                        //       fontSize: 12,
                                        //       fontWeight: FontWeight.bold),
                                        // ),

                                        chat["user"] == "you" &&
                                                chat["chat"] == ""
                                            ? Container(
                                                width: 40,
                                                child: SpinKitThreeBounce(
                                                  color: Colors.grey,
                                                  size: 20.0,
                                                ),
                                              )
                                            : Text(
                                                chat["chat"],
                                                style: TextStyle(
                                                    color: chat["user"] == "me"
                                                        ? Colors.white
                                                        : Colors.black,
                                                    fontSize: 15),
                                              ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    chat["date"].substring(0, 16),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            );
                          }))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: Colors.white),
                        width: 300,
                        child: TextField(
                          controller: myController,
                          // onChanged: (value) => {
                          //   setState(() {
                          //     _chat = value;
                          //   })
                          // },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '메시지를 입력하세요.',
                            contentPadding: const EdgeInsets.only(
                                left: 14.0, bottom: 6.0, top: 6.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Container(
                        // width: 50,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                            ),
                            onPressed: () async {
                              // Add your onPressed code here!
                              setState(() {
                                _chattingList.add({
                                  "user": "me",
                                  "chat": _chat,
                                  "date": DateTime.now().toString()
                                });
                              });
                              String tempChat = _chat;
                              myController.text = "";
                              print(controller.chattingList);
                              setState(() {
                                _chattingList.add({
                                  "user": "you",
                                  "chat": "",
                                  "date": DateTime.now().toString()
                                });
                              });
                              dynamic newChat =
                                  await controller.sendChat(2, tempChat);
                              setState(() {
                                _chattingList[_chattingList.length - 1] =
                                    newChat;
                              });

                              controller.update();
                            },
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 18,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              )),
        ));
  }
}
