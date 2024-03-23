import 'dart:typed_data';

import 'package:date_field/date_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:goodbye_frontend/commons/color.dart';
import 'package:goodbye_frontend/commons/commonController.dart';
import 'package:goodbye_frontend/pages/ChattingPage.dart';
import 'package:goodbye_frontend/pages/LobbyPage.dart';
import 'package:goodbye_frontend/widgets/BottomButton.dart';
import 'dart:typed_data';

import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';

class AddTargetPage extends StatefulWidget {
  const AddTargetPage({super.key});

  @override
  State<AddTargetPage> createState() => _AddTargetPageState();
}

class _AddTargetPageState extends State<AddTargetPage> {
  String _name = '';
  String _relationship = '';

  String _gender = '';

  String _alias = '';
  DateTime? _lostDate = DateTime.now();

  String _kakaoData = '';

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('등록하기',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          backgroundColor: primaryColor,
        ),
        body: Center(
          child: Container(
              alignment: Alignment.topCenter,
              width: 390,
              child: Column(children: [
                Expanded(
                  child: Container(
                      alignment: Alignment.topCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "이름",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                _name = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: '상대방의 이름을 입력해주세요',
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 32),
                          Text(
                            "관계",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                _relationship = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: '상대방의 관계를 입력해주세요',
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "성별",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              ChoiceChip(
                                labelPadding: EdgeInsets.all(2.0),
                                label: Text(
                                  "여자",
                                  style: _gender == "여자"
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: Color(0xFFF1F0F5),
                                              fontSize: 14)
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: Color(0xFFB0AEB8),
                                              fontSize: 14),
                                ),
                                backgroundColor: Color(0xFFF1F0F5),
                                selected: _gender == "여자",
                                selectedColor: primaryColor,

                                onSelected: (value) {
                                  setState(() {
                                    _gender = "여자";
                                  });
                                },
                                // backgroundColor: color,
                                elevation: 1,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ChoiceChip(
                                labelPadding: EdgeInsets.all(2.0),
                                label: Text(
                                  "남자",
                                  style: _gender == "남자"
                                      ? Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: Color(0xFFF1F0F5),
                                              fontSize: 14)
                                      : Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              color: Color(0xFFB0AEB8),
                                              fontSize: 14),
                                ),
                                backgroundColor: Color(0xFFF1F0F5),

                                selected: _gender == "남자",
                                selectedColor: primaryColor,
                                onSelected: (value) {
                                  setState(() {
                                    _gender = "남자";
                                  });
                                },
                                // backgroundColor: color,
                                elevation: 1,
                              )
                            ],
                          ),
                          SizedBox(height: 32),
                          Text(
                            "호칭",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          TextField(
                            onChanged: (value) {
                              setState(() {
                                _alias = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: '상대방의 호칭을 입력해주세요',
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                          ),
                          SizedBox(height: 32),
                          Text(
                            "이별날짜",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          DateTimeFormField(
                            decoration: const InputDecoration(
                              hintText: '이별 날짜를 입력해주세요.',
                              hintStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                              helperText: 'YYYY/MM/DD',
                            ),
                            firstDate: DateTime.now()
                                .subtract(const Duration(days: 30)),
                            lastDate:
                                DateTime.now().add(const Duration(days: 0)),
                            mode: DateTimeFieldPickerMode.date,
                            onChanged: (DateTime? value) {
                              setState(() {
                                _lostDate = value;
                              });
                            },
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text(
                            "카카오톡 불러오기",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                          Container(
                            width: 100,
                            alignment: Alignment.center,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(0),
                                    primary: Color(0xFFF1F0F5),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(2))),
                                onPressed: () async {
                                  // scaffold.showSnackBar(
                                  //     SnackBar(content: Text('')));
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '불러오기',
                                      style: TextStyle(color: primaryColor),
                                    ),
                                    Icon(
                                      Icons.attach_file,
                                      color: primaryColor,
                                    )
                                  ],
                                )),
                          ),
                        ],
                      )),
                ),
                BottomButton(
                    text: '제출하기',
                    onPressed: () {
                      final controller = Get.put(CommonController());

                      if (_name.isEmpty) {
                        scaffold.showSnackBar(SnackBar(
                          content: Text('이름을 입력해주세요.'),
                        ));
                        return;
                      }
                      if (_relationship.isEmpty) {
                        scaffold.showSnackBar(SnackBar(
                          content: Text('관계를 입력해주세요.'),
                        ));
                        return;
                      }

                      if (_gender.isEmpty) {
                        scaffold.showSnackBar(SnackBar(
                          content: Text('성별을 선택해주세요.'),
                        ));
                        return;
                      }

                      if (_alias.isEmpty) {
                        scaffold.showSnackBar(SnackBar(
                          content: Text('호칭을 입력해주세요.'),
                        ));
                        return;
                      }

                      if (_lostDate == null) {
                        scaffold.showSnackBar(SnackBar(
                          content: Text('이별날짜를 입력해주세요.'),
                        ));
                        return;
                      }

                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          controller.seq = 2;
                          controller.targetName = _alias;
                          print(_alias);
                          controller.targetDday =
                              -_lostDate!.difference(DateTime.now()).inDays;
                          controller.update();

                          return LobbyPage();
                        },
                      ));
                    }),
                SizedBox(
                  height: 20,
                )
              ])),
        ));
  }
}
