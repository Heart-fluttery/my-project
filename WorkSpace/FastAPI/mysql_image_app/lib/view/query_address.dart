import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mysql_image_app/view/insert_address.dart';
import 'package:mysql_image_app/view/update_address.dart';

class QueryAddress extends StatefulWidget {
  const QueryAddress({super.key});

  @override
  State<QueryAddress> createState() => _QueryAddressState();
}

class _QueryAddressState extends State<QueryAddress> {
  List data = [];

  @override
  void initState() {
    super.initState();
    getJSONData();
  }

  getJSONData()async{
    var response = await http.get(Uri.parse("http://127.0.0.1:8000/select"));
    data.clear();
    data.addAll(json.decode(utf8.decode(response.bodyBytes))['results']);
    setState(() {});
    // print(data); // 데이터 잘 들어오는지 확인용
  }


  // -------------



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주소록 검색'),
        actions: [
          IconButton(
            onPressed: () => Get.to(()=> InsertAddress())!.then((value) => getJSONData()), 
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(
        child: data.isEmpty
        ? Center(child: Text('데이터가 없습니다.'),)
        : ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(()=> UpdateAddress(),
                  arguments: [
                    data[index]['seq'],
                    data[index]['name'],
                    data[index]['phone'],
                    data[index]['address'],
                    data[index]['relation'],
                  ]
                )!.then((value) => getJSONData());
              },
              child: Slidable(
                endActionPane: ActionPane(
                  motion: BehindMotion(), 
                  children: [
                    SlidableAction(
                      backgroundColor: Colors.red,
                      icon: Icons.delete_forever,
                      label: "Delete",
                      onPressed: (context) => deleteAction(data[index]['seq']),
                    ),
                  ],
                ),
                child: Card(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network("http://127.0.0.1:8000/view/${data[index]['seq']}?t=${DateTime.now().microsecondsSinceEpoch}",
                        width: 100,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("이름 : ${data[index]['name']}",),
                          Text("전화번호 : ${data[index]['phone']}",),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  } // build

  // --- Functions ---
  deleteAction(int seq){
    getJSONDataDelete(seq);
    getJSONData();
  }

    getJSONDataDelete(int seq)async{
    var response = await http.delete(Uri.parse("http://127.0.0.1:8000/delete/$seq"));
    var result = json.decode(utf8.decode(response.bodyBytes))['result'];
    if(result != "OK"){
      errorSnackBar();
    }
    // print(data); // 데이터 잘 들어오는지 확인용
  }

  errorSnackBar(){
    Get.snackbar(
      "경고", 
      "입력 중 문제가 발생했습니다",
      colorText: Theme.of(context).colorScheme.onError,
      backgroundColor: Theme.of(context).colorScheme.error,
      );
  }

  showDialog(){
    Get.defaultDialog(
      title: '입력 결과',
      middleText: '입력이 완료되었습니다.',
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          }, 
          child: Text('나가기'),
        ),
      ]
    );
  }

} // class