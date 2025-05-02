import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqlite_image_app/view/insert_address.dart';
import 'package:sqlite_image_app/view/update_address.dart';
import 'package:sqlite_image_app/vm/database_handler.dart';

class QueryAddress extends StatefulWidget {
  const QueryAddress({super.key});

  @override
  State<QueryAddress> createState() => _QueryAddressState();
}

class _QueryAddressState extends State<QueryAddress> {
  // Property
  late DatabaseHandler handler;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주소록 검색'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(InsertAddress())!.then((value) => reloadData());
            }, 
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryAddress(), 
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  key: ValueKey(snapshot.data?[index]),
                  onDismissed: (direction) async{
                    await handler.deleteAddress(snapshot.data![index].id!);
                    snapshot.data!.remove(snapshot.data![index]);
                    setState(() {});
                  },
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        UpdateAddress(),
                        arguments: [
                          snapshot.data![index].id!,
                          snapshot.data![index].name,
                          snapshot.data![index].phone,
                          snapshot.data![index].address,
                          snapshot.data![index].relation,
                          snapshot.data![index].image,
                        ]
                      )!.then((value) => reloadData());
                      // 수정하고 왔으면 리로드
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Image.memory(
                            snapshot.data![index].image,
                            width: 100,
                          ),
                          Column(
                            children: [
                              Text(
                                '이름 : ${snapshot.data![index].name}'
                              ),
                              Text(
                                '전화번호 : ${snapshot.data![index].phone}'
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  } // build

  // --- Functions ---
  reloadData(){
    handler.queryAddress();
    setState(() {});
  }

} // class