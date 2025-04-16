import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with WidgetsBindingObserver{
  /*
  WidgetsBindingObserver는 내 앱에 있는게 아니어서 dispose로 정리가 안 됨
  */
  // Property
  late TextEditingController userIdController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // home(this)을 관찰하는 옵저버 추가
    userIdController = TextEditingController();
    passwordController = TextEditingController();
    // Shared Preference 초기화
    initSharedPreferences();
  }

  initSharedPreferences()async{ // 내 앱 외부라서 async
    final prefs = await SharedPreferences.getInstance();
    userIdController.text = prefs.getString('p_userId') ?? "";
    passwordController.text = prefs.getString('p_password') ?? "";
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch(state){
      case AppLifecycleState.detached: // 뒤로 이동할 때
        print('detached');
      case AppLifecycleState.resumed: // 앞으로 이동할 때
        print('resume');
      case AppLifecycleState.inactive: // 지울 때
        disposeSharedPreferences();
        print('inactive');
      case AppLifecycleState.paused:
        print('paused');
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  disposeSharedPreferences()async{
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // prefs.remove('p_password'); // 일부만 지울 때
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/login.png'),
              radius: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: userIdController,
                decoration: InputDecoration(
                  labelText: '사용자 ID를 입력하세요'
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: '패스워드를 입력하세요'
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if(userIdController.text.trim().isEmpty || passwordController.text.trim().isEmpty){
                  errorSnackBar();
                }else{
                  _showDialog();
                }
              }, 
              child: Text('Log In'),
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---
  errorSnackBar(){
    Get.snackbar(
      '경고', 
      '사용자 ID와 암호를 입력하세요',
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 2),
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error
    );
  }

  _showDialog(){
    Get.defaultDialog(
      title: '환영합니다',
      middleText: '신분이 확인되었습니다.',
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () {
            Get.back(); // 다이얼로그 지우기
            saveSharedPreferences(); // Id, Password 저장
            Get.to(SecondPage()); // 화면 이동
          }, 
          child: Text('Exit'),
        ),
      ]
    );
  }

  saveSharedPreferences()async{ // 내 앱 외부에 저장하는거라 async(장소는 모름)
    final prefs = await SharedPreferences.getInstance(); // 이 부분은 쓸 때마다 적어줘야함
    prefs.setString('p_userId', userIdController.text);
    prefs.setString('p_password', passwordController.text);
  }

} // class