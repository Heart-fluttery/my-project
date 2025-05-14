/*
2025.04.29 이학현
Gridview로 이미지 - 가게이름 나오게 만들기
search textfiled 만들고 기존 query handler에 where 추가해서 textfiled.text 변수로 잡고 like '%$변수%'
*/
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:must_eat_place_app/view/add_place.dart';
import 'package:must_eat_place_app/view/ontaplocator.dart';
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
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: '검색',
                    hintText: '상호명 혹은 남겼던 평가로 검색해 보세요'
                  ),
                  onChanged: (value) {
                    handler.queryEatplace(value);
                    setState(() {});
                  } 
                ),
              ),
              FutureBuilder(
                future: handler.queryEatplace(controller.text), 
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
                            child: GestureDetector(
                              onTap: () => Get.to(Ontaplocator(),arguments: [snapshot.data![index].latitude, snapshot.data![index].longitude, snapshot.data![index].name]),
                              child: Card(
                                color: snapshot.data![index].favorite == 0? const Color.from(alpha: 1, red: 0.988, green: 0.867, blue: 1):const Color.fromRGBO(255, 164, 202, 1),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Image.memory(
                                        snapshot.data![index].image,
                                        fit: BoxFit.fill,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            snapshot.data![index].name,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                    FutureBuilder(
                              future: getAddressFromLatLng(place.latitude, place.longitude),
                              builder: (context, addressSnapshot) {
                                if (!addressSnapshot.hasData) {
                                  return Text("주소 불러오는 중...");
                                } else {
                                  return SizedBox(width: 104, child: Text(addressSnapshot.data!,overflow: TextOverflow.ellipsis,));
                                }}),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                          child: Row(
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
                                          ),
                                        ),
                                      ],
                                    ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
                                  child: IconButton(
                                    onPressed: () async{
                                      int newValue = snapshot.data![index].favorite == 0 ? 1 : 0;
                                      await handler.updateFavorite(snapshot.data![index].id!, newValue);
                                      setState(() {});
                                    }, 
                                    icon: Icon(snapshot.data![index].favorite==0? Icons.favorite_border:Icons.favorite),
                                    style: IconButton.styleFrom(
                                      foregroundColor: Colors.pink
                                    ),
                                    ),
                                ),
                                  ],
                                ),
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
            ],
          ),
        ),
      ),
    );
  } // build

  // --- Functions ---
  reloadData(){
    handler.queryEatplace(controller.text);
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