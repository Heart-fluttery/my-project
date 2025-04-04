import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) { // build는 카메라, Scaffold를 렌더
    return Scaffold( // context는 Scaffold의 메모리?
      appBar: AppBar(
        title: Text('Snack Bar'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: MySnackBar()
    );
  } // build

} // Class