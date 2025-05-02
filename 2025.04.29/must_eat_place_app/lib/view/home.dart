/*
2025.04.29 이학현
Gridview로 이미지 - 가게이름 나오게 만들기
*/
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:must_eat_place_app/view/add_place.dart';
import 'package:must_eat_place_app/view/update_place.dart';
import 'package:must_eat_place_app/vm/database_handler.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        title: Text('내가 경험한 맛집 리스트'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(AddPlace())!.then((value) {
                reloadData();
              });
            },
            icon: Icon(Icons.add_outlined),
          ),
        ],
      ),
      body: FutureBuilder(
        future: handler.queryEatplace(), 
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Expanded(
              child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var place = snapshot.data![index];
                  int score = snapshot.data![index].score;
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: BehindMotion(), 
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.green,
                          icon: Icons.edit,
                          label: 'Edit',
                          onPressed: (context) {
                            Get.to(UpdatePlace(),arguments: snapshot.data![index])!.then((value) => reloadData());
                          },
                        ),
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: BehindMotion(), 
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          label: 'Delete',
                          onPressed: (context) {
                            handler.deleteEatPlace(snapshot.data![index].id!);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
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
                                snapshot.data![index].name,
                              ),
                              Row(
                                children: [
                                  ...List.generate(5, (starindex){
                                    return Icon(
                                      starindex < score ?
                                      Icons.star
                                      : Icons.star_border,
                                      color: Colors.amber,
                                    );
                                  }),
                                  // 이건 수정화면에 들어가야할 기능
                                  // ...List.generate(5, (index){
                                  //   return IconButton(
                                  //     onPressed: () {
                                  //       snapshot.data![index].score = index + 1;
                                  //       setState(() {});
                                  //     }, 
                                  //     icon: Icon(index < snapshot.data![index].score 
                                  //       ? Icons.star
                                  //       : Icons.star_border,
                                  //       color: Colors.amber,
                                  //     ),
                                  //   );
                                  // }),
                                ],
                              )
                            ],
                          ),
                          FutureBuilder(
                    future: getAddressFromLatLng(place.latitude, place.longitude),
                    builder: (context, addressSnapshot) {
                      if (!addressSnapshot.hasData) {
                        return Text("주소 불러오는 중...");
                      } else {
                        return Text(addressSnapshot.data!);
                      }}),
                        ],
                      ),
                    ),
                  );
                },
                ),
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
    handler.queryEatplace();
    setState(() {});
  }

  successSnackbar(){
    Get.snackbar('저장 성공', '리스트가 생성됐습니다');
  }
  
  Future<String> getAddressFromLatLng(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    Placemark place = placemarks[0];
    return '${place.locality} ${place.subLocality}';
  }
} // class