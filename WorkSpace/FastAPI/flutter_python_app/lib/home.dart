import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String result = "_______";
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter with Python'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              result
            ),
            TextButton(
              onPressed: () => getJSONData(), 
              child: Text('Connect'),
            ),
            Container(
              width: 200,
              child: TextField(
                controller: controller,
              ),
            ),
            TextButton(
              onPressed: () => getJSONDatafromitem(), 
              child: Text('Item Connect'),
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---
  getJSONData()async{
    var url = Uri.parse('http://127.0.0.1:8000');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['message'];
    setState(() {});
  }

  getJSONDatafromitem()async{
    var url = Uri.parse('http://127.0.0.1:8000/items/${controller.text}');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['item_id'].toString();
    setState(() {});
  }


} // class