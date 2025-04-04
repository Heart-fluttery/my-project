import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/view/mail.dart';
import 'package:navigator_appbar_ex_app/view/receivedmail.dart';
import 'package:navigator_appbar_ex_app/view/sendmail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/mail',
      routes: {
        '/mail' : (context) => Mail(),
        '/send' : (context) => Sendmail(),
        '/receive' : (context) => Receivedmail(),
      },
    );
  }
}