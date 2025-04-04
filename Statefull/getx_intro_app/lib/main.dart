import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:getx_intro_app/third_page.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // pubspec 바꿔도 이 부분을 바꿔야 Get 쓸 수 있음
      title: 'Flutter Demo',
      localizationsDelegates: [ // Delegat 권한 대행
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
      getPages: [
        GetPage(
          name: '/third',
          page: () => ThirdPage(),
        ),
        GetPage(
          name: '/third2', 
          page: () => ThirdPage(),
          transition: Transition.circularReveal,
          transitionDuration: Duration(seconds: 3)
        ),
      ],
    );
  }
}