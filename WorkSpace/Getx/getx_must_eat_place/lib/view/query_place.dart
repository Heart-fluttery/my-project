import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getx_must_eat_place/vm/vm_handler_temp.dart';

import 'edit_place.dart';
import 'insert_place.dart';
import 'map_place.dart';

class QueryPlace extends StatelessWidget {
  const QueryPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final vmHandler = Get.find<VmHandlerTemp>();
    vmHandler.queryAddress();


    return Obx(()=>
      Scaffold(
        appBar: AppBar(
          title: Text("내가 경험한 맛집 리스트"),
          actions: [
            IconButton(
              onPressed:() {
                Get.to(() => InsertPlace());
              },
              icon: Icon(Icons.add)
            )
          ],
        ),
        body: vmHandler.hasListeners
        ? Center(child: Text("데이터가 없습니다"),)
        : ListView.builder(
            itemCount: vmHandler.addresses.length,
            itemBuilder: (context, index) {
              final address = vmHandler.addresses[index];
              return GestureDetector(
                onTap: () => Get.to(() => MapPlace(),arguments: [address.lat, address.lng]),
                child: Slidable(
                  endActionPane: ActionPane(
                    motion: BehindMotion(), 
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.grey,
                        icon: Icons.edit,
                        label: "삭제",
                        onPressed: (context) async{
                          // vm.deleteAddressAll(address.id!);
                          int? idNum = address.id;
                          await vmHandler.deleteAddress(idNum!);
                        },
                      )
                    ]
                    ),
                  startActionPane: ActionPane(
                    motion: BehindMotion(), 
                    children: [
                      SlidableAction(
                        backgroundColor: Colors.grey,
                        icon: Icons.edit,
                        label: "수정",
                        onPressed: (context) {
                          Get.to(() => EditPlace(),
                          arguments:[
                            address.id,
                            address.name,
                            address.phone,
                            address.estimate,
                            address.lat,
                            address.lng,
                            address.image
                          ] 
                          );
                        },
                      ),
                    ]
                    ),
                  child: Card(
                    child: Row(
                      children: [
                        Image.memory(address.image,width: 100,height: 80,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("명칭: ${address.name}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("전화번호: ${address.phone}")
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
  }//build
}//class