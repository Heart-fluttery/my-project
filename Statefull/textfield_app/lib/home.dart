import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Property
  late TextEditingController textEditingController;
  late String message;
  late int secon;
  late Color backColor;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController(); // 키보드는 구글에서 제공하는 class 사용
    message = "";
    secon = 0;
    backColor = Colors.blueAccent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Single Textfield'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField( // 시연영상에서 컴퓨터 키보드로 하면 안 되고 command+f로 키보드 띄우기
                controller: textEditingController,
                decoration: InputDecoration(
                  labelText: '내용을 입력하세요',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueAccent)
                  ),
                ),
                keyboardType: TextInputType.text, // 이게 기본값
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () => checkData(message, secon, backColor),
                  child: Text('출력'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } // build

// ---- Functions ----
checkData(String message, int secon, Color backColor){
  if(textEditingController.text.trim().isEmpty){
    // Error Message
    showSnackBar("너 죽을래? 왜 시키는대로 안해", 2, Colors.redAccent);
  }else{
    // Display
    showSnackBar("입력하신 내용은 ${textEditingController.text}입니다.", 3, Colors.blueAccent);
  }
}

  showSnackBar(message, secon, backColor){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: secon),
        backgroundColor: backColor,
        )
    );
  }

  // errorSnackBar(){
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('너 죽을래? 왜 시키는대로 안해'),
  //       duration: Duration(seconds: 2),
  //       backgroundColor: Colors.redAccent,
  //     ),
  //   );
  // }

  // showSnackBar(){
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('입력하신 내용은 ${textEditingController.text}입니다.'),
  //       duration: Duration(seconds: 3),
  //       backgroundColor: Colors.blueAccent,
  //     ),
  //   );
  // }

} // class