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

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryState();
}

class _DiaryState extends State<DiaryPage> {
  _DiaryState();

  // List<dynamic> _diaryList = [{
  //   "date": ,

  // }];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CommonController());

    return Scaffold();
  }
}
