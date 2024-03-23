import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goodbye_frontend/commons/commonController.dart';
import 'package:goodbye_frontend/pages/ChattingPage.dart';

double pi = 3.141592;

class LobbyPage extends StatelessWidget {
  const LobbyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);

    final controller = Get.put(CommonController());
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: 390,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 600,
                child: GestureDetector(
                  onTap: () {
                    scaffold.showSnackBar(SnackBar(content: Text('개발 중 입니다.')));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xffffffff),
                            Color.fromARGB(75, 236, 232, 255)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        )),
                    width: 390,
                    height: 250,
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 130),
                        child: Text("이별 마무리하기",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey[800],
                            ))),
                  ),
                ),
              ),
              Positioned(
                top: 480,
                child: GestureDetector(
                  onTap: () {
                    scaffold.showSnackBar(SnackBar(content: Text('개발 중 입니다.')));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70),
                        ),
                        gradient: LinearGradient(
                          colors: [Color(0xff7A7996), Color(0xffA2A1CC)],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )),
                    width: 390,
                    height: 250,
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 130),
                        child: Text("마음일기",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.grey[800],
                            ))),
                  ),
                ),
              ),
              Positioned(
                top: 360,
                child: GestureDetector(
                  onTap: () => {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return ChattingPage(
                          seq: 2,
                        );
                      },
                    ))
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 103, 101, 126),
                            Color.fromARGB(255, 121, 114, 153)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        )),
                    width: 390,
                    height: 250,
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 130),
                        child: Text("채팅하기",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                            ))),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70),
                        bottomRight: Radius.circular(70),
                      ),
                      gradient: LinearGradient(
                        colors: [Color(0xff55546B), Color(0xff8180A0)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )),
                  width: 390,
                  height: 500,
                ),
              ),
              Positioned(
                top: 150,
                left: 100,
                child: Container(
                  width: 190,
                  height: 190,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Color(0xfff1f0f5), Color(0x55f1f0f5)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )),
                ),
              ),
              Positioned(
                top: 217,
                child: Container(
                    width: 390,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text(
                          "이별한 지",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          controller.targetDday.toString() + "일 째",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ),
              Positioned(
                top: 40,
                child: Container(
                  width: 390,
                  alignment: Alignment.center,
                  child: Text(
                    controller.targetName,
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 43,
                right: 31,
                child: Container(
                  // width: 390,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
