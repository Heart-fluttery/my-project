import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/user_data.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text('내 정보'),
        actions: [
          Image.asset('images/ratedit.gif')
        ],
        backgroundColor: Color(0xFFFAF9F7),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(Userdata.imagePath),
                radius: 160,
              ),
              Text('이미지 변경'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Userdata.imagePath = 'images/2022.jpg';
                      setState(() {});
                    }, 
                    child: Text('2022'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Userdata.imagePath = 'images/2023.jpg';
                      setState(() {});
                    }, 
                    child: Text('2023'),
                  ),
                ],
              ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Userdata.imagePath = 'images/201157139.jpeg';
                          setState(() {});
                        }, 
                        child: Text('2024'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Userdata.imagePath = 'images/2024ani.webp';
                          setState(() {});
                        }, 
                        child: Text('2024 - 지브리ver'),
                      ),
                  ElevatedButton(
                    onPressed: () {
                      Userdata.imagePath = 'images/2025.jpg';
                      setState(() {});
                    }, 
                    child: Text('2025'),
                  ),
                    ],
                  ),
                  Text('닉네임 변경'),
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
                        onPressed: () => nickNameController.clear(),
                        child: Text('취소'),
                      ),
                  ElevatedButton(
                    onPressed: () {
                      if (nickNameController.text.trim() == Userdata.nickName){
                        Get.snackbar('다시 확인해 주세요', '현재 닉네임과 동일합니다');
                      }else if(nickNameController.text.trim().isNotEmpty){
                        Userdata.nickName = nickNameController.text.trim();
                        Get.snackbar('닉네임 변경 완료', '변경된 닉네임 : ${Userdata.nickName}');
                        setState(() {});
                      }else if(nickNameController.text.trim().isEmpty){
                        Get.snackbar('변경할 수 없습니다', '닉네임을 입력해 주세요');
                      }
                    },
                    child: Text('변경'),
                  ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => nickNameController.clear(),
                    child: Text('로그아웃'),
                  ),
            ],
          ),
        ),
      ),
      drawer: mainDrawer(context, 'profile'),
    );
  }
}