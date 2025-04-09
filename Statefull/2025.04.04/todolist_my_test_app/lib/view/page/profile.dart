import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/user_data.dart';
import 'package:todolist_my_test_app/view/page/home.dart';
import 'package:todolist_my_test_app/widget/drawer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late TextEditingController nickNameController;

  @override
  void initState() {
    super.initState();
    nickNameController = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xFFFAF9F7),
        appBar: AppBar(
          title: Text('내 정보',
        style: TextStyle(
          color: Color(0xFF3F3F3F)
        ),),
          actions: [
            GestureDetector(
              onTap: () {
                Userdata.ratChange = !Userdata.ratChange;
                setState(() {});
              },
              child: Image.asset(
                Userdata.ratChange? 'images/ratedit.gif' : 'images/ratedit_out2.gif',
              ),
            ),
          ],
          backgroundColor: Color(0xFFD7C0E6),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(Userdata.imagePath),
                    radius: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('아래 버튼을 눌러 프로필 사진을 바꿔보세요',
                    style: TextStyle(
                      color: Color(0xFF3F3F3F),
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Userdata.buttonColor == 1? Color(0xFF8BB8E8) : Color(0xFFD7C0E6)
                            ),
                        onPressed: () {
                          Userdata.buttonColor = 1;
                          Userdata.imagePath = 'images/2022.jpg';
                          setState(() {});
                        }, 
                        child: Text('2022',
                        style: TextStyle(
                          color: Color(0xFF3F3F3F)
                        ),),
                      ),
                      ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Userdata.buttonColor == 2? Color(0xFF8BB8E8) : Color(0xFFD7C0E6)
                            ),
                        onPressed: () {
                          Userdata.buttonColor = 2;
                          Userdata.imagePath = 'images/2023.jpg';
                          setState(() {});
                        }, 
                        child: Text('2023',
                        style: TextStyle(
                          color: Color(0xFF3F3F3F)
                        ),),
                      ),
                    ],
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Userdata.buttonColor == 3? Color(0xFF8BB8E8) : Color(0xFFD7C0E6)
                            ),
                            onPressed: () {
                              Userdata.buttonColor = 3;
                              Userdata.imagePath = 'images/201157139.jpeg';
                              setState(() {});
                            }, 
                            child: Text('2024',
                        style: TextStyle(
                          color: Color(0xFF3F3F3F)
                        ),),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Userdata.buttonColor == 4? Color(0xFF8BB8E8) : Color(0xFFD7C0E6)
                            ),
                            onPressed: () {
                              Userdata.buttonColor = 4;
                              Userdata.imagePath = 'images/2024ani.webp';
                              setState(() {});
                            }, 
                            child: Text('2024 - 지브리ver',
                        style: TextStyle(
                          color: Color(0xFF3F3F3F)
                        ),),
                          ),
                      ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Userdata.buttonColor == 5? Color(0xFF8BB8E8) : Color(0xFFD7C0E6)
                            ),
                        onPressed: () {
                          Userdata.buttonColor = 5;
                          Userdata.imagePath = 'images/2025.jpg';
                          setState(() {});
                        }, 
                        child: Text('2025',
                        style: TextStyle(
                          color: Color(0xFF3F3F3F)
                        ),),
                      ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('닉네임 변경',
                        style: TextStyle(
                          color: Color(0xFF3F3F3F),
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),
                        ),
                      ),
                      TextField(
                        controller: nickNameController,
                        keyboardType: TextInputType.text,
                        maxLength: 30,
                        maxLines: 1,
                        decoration: InputDecoration(
                          labelText: '현재 닉네임 : ${Userdata.nickName}'
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(90, 40),
                              backgroundColor: Color(0xFFD7C0E6)
                            ),
                            onPressed: () {
                              nickNameController.clear();
                              FocusScope.of(context).unfocus();
                            },
                            child: Text('지우기',
                        style: TextStyle(
                          color: Color(0xFF3F3F3F)
                        ),),
                          ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(90, 40),
                          backgroundColor: Color(0xFF8BB8E8)
                        ),
                        onPressed: () {
                          if (nickNameController.text.trim() == Userdata.nickName){
                            Get.snackbar('다시 확인해 주세요', '현재 닉네임과 동일합니다');
                          }else if(nickNameController.text.trim().isNotEmpty){
                            Userdata.nickName = nickNameController.text.trim();
                            Get.snackbar('닉네임 변경 완료', '변경된 닉네임 : ${Userdata.nickName}');
                            nickNameController.clear();
                            FocusScope.of(context).unfocus();
                            setState(() {});
                          }else if(nickNameController.text.trim().isEmpty){
                            Get.snackbar('변경할 수 없습니다', '닉네임을 입력해 주세요');
                          }
                        },
                        child: Text('변경',
                        style: TextStyle(
                          color: Color(0xFF3F3F3F)
                        ),),
                      ),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFF6B6B)
                        ),
                        onPressed: () {
                          Get.defaultDialog(
                            title: '로그아웃하시겠습니까?',
                            titleStyle: TextStyle(
                              fontSize: 20,
                            ),
                            content: Stack(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFFD7C0E6)
                                          ),
                                          onPressed: () => Get.back(),
                                          child: Text('취소',
                                          style: TextStyle(
                                            color: Color(0xFF3F3F3F)
                                          ),),
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xFFFF6B6B)
                                          ),
                                          onPressed: () {
                                            Get.back();
                                            Get.off(Home());
                                          },
                                          child: Text('로그아웃',
                                          style: TextStyle(
                                            color: Color(0xFFFAF9F7)
                                          ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            )
                          );
                        },
                        child: Text('로그아웃',
                        style: TextStyle(
                          color: Color(0xFFFAF9F7)
                        ),),
                      ),
                ],
              ),
            ),
          ),
        ),
        drawer: mainDrawer(context, 'profile'),
      ),
    );
  }
}