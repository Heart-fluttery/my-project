/*
  작성일 2025.04.04 작성자 이학현
  로그인 페이지, 회원가입은 구현 못함
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_my_test_app/model/user_data.dart';
import 'package:todolist_my_test_app/model/user_frame.dart';
import 'package:todolist_my_test_app/view/page/mainscreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController idcontroller; // 아이디 입력
  late TextEditingController pwcontroller; // 비밀번호 입력
  late List<Userframe> useridpw; // 유저 아이디 비밀번호

  @override
  void initState() {
    super.initState();
    idcontroller = TextEditingController();
    pwcontroller = TextEditingController();
    useridpw = [];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Color(0xFFFAF9F7),
        appBar: AppBar(
          toolbarHeight: 350,
          backgroundColor: Color(0xFFD7C0E6),
          title: Image.asset('images/image (1).png',
          height: 300,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // CircleAvatar( // appbar로 이동
                  //   radius: 100,
                  //   backgroundColor: Colors.blueAccent,
                  //   child: Icon(
                  //     Icons.person,
                  //     color: Colors.white,
                  //     size: 150,
                  //   ),
                  // ),
                  TextField(
                    controller: idcontroller,
                    maxLines: 1,
                    maxLength: 40,
                    decoration: InputDecoration(
                      hintText: '아이디를 입력해 주세요',
                      hintStyle: TextStyle(
                        color: Color(0xA63F3F3F)
                      ),
                    ),
                  ),
                  TextField(
                    controller: pwcontroller,
                    obscureText: true,
                    maxLines: 1,
                    maxLength: 40,
                    decoration: InputDecoration(
                      hintText: '비밀번호를 입력해 주세요',
                      hintStyle: TextStyle(
                        color: Color(0xA63F3F3F)
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      idpwCheck();
                    }, 
                    child: Text('로그인',
                    style: TextStyle(
                      color: Color(0xFF3F3F3F)
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } // build

  // ---- Functions ----
  idpwCheck(){
    if (idcontroller.text != Userdata.idpw[0].userid || pwcontroller.text != Userdata.idpw[0].userpw) {
      Get.snackbar(
        '다시 확인해 주세요',
        '아이디 또는 비밀번호가 불일치 합니다',
        duration: Duration(seconds: 2),
      );
    }else if (idcontroller.text == Userdata.idpw[0].userid && pwcontroller.text == Userdata.idpw[0].userpw){
      Get.snackbar(
        '환영합니다', 
        Userdata.nickName,
        duration: Duration(seconds: 2),
      );
      Get.off(Mainscreen());
    }
  }
} // class