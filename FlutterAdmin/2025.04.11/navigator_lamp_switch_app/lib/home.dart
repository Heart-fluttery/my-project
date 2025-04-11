import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:navigator_lamp_switch_app/buttonvalue.dart';
import 'package:navigator_lamp_switch_app/editpage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String imageName;

  @override
  void initState() {
    super.initState();
    imageName = 'images/lamp_on.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main화면'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async{
              await Get.to(Editpage());
              rebuildData();
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          imageName,
          width: 200,
          height: 300,
        ),
      ),
    );
  }

  rebuildData(){
    if(!Buttonvalue.onOffButton){
      imageName = 'images/lamp_off.png';
    }else if(Buttonvalue.colorButton){
      imageName = 'images/lamp_on.png';
    }else {
      imageName = 'images/lamp_red.png';
    }
    setState(() {});
  }
}