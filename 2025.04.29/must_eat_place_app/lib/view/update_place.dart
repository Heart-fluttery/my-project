import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:must_eat_place_app/model/eat_place.dart';
import 'package:must_eat_place_app/view/locator.dart';
import 'package:must_eat_place_app/vm/database_handler.dart';

class UpdatePlace extends StatefulWidget {
  const UpdatePlace({super.key});

  @override
  State<UpdatePlace> createState() => _UpdatePlaceState();
}

class _UpdatePlaceState extends State<UpdatePlace> {
  late DatabaseHandler handler;
  late int selectscore;
  late double lat;
  late double long;
  late int favorite;
  late TextEditingController namecontroller;
  late TextEditingController telcontroller;
  late TextEditingController reviewcontroller;

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  EatPlace value = Get.arguments ?? "__";

  late int firstDisp;

@override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    selectscore = value.score;
    lat = value.latitude;
    long = value.longitude;
    favorite = value.favorite;
    namecontroller = TextEditingController();
    namecontroller.text = value.name;
    telcontroller = TextEditingController();
    telcontroller.text = value.tel;
    reviewcontroller = TextEditingController();
    reviewcontroller.text = value.review;

    firstDisp = 0;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('맛집 추가'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                favorite = favorite==0? 1:0;
                setState(() {});
              }, 
              icon: Icon(favorite == 1?Icons.favorite:Icons.favorite_border,
              color: Colors.pink,),
            ),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () => getImageFromGallery(ImageSource.gallery), 
                      child: Text('사진 가져오기'),
                    ),
                  ),
                  firstDisp == 0
                  ? Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.grey,
                    child: Center(
                      child: Image.memory(value.image)
                    ),
                  )
                  : Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.grey,
                    child: Center(
                      child: imageFile == null
                      ? Text(
                        '위 버튼을 눌러\n이미지를 선택해 주세요',
                        textAlign: TextAlign.center,
                        )
                      : Image.file(File(imageFile!.path))
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => Locator(isEditMode: true),arguments: [lat, long])?.then((value) {
                          if (value != null) {
                            reloadLocation(value);
                          }
                        });
                      },
                      child: Text('위치 정하기'),
                    ),
                  ),
                  Row(
                    children: [
                      FutureBuilder(
                      future: getAddressFromLatLng(lat, long),
                      builder: (context, addressSnapshot) {
                        if (!addressSnapshot.hasData) {
                          return Text("주소 불러오는 중...");
                        } else {
                          return Text(addressSnapshot.data!);
                        }}),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        hintText: '상호명을 입력해 주세요',
                        labelText: '상호명'
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: telcontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '가게 연락처를 입력해 주세요',
                        labelText: '가게 연락처'
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ...List.generate(5, (index){
                    return IconButton(
                      onPressed: () {
                        selectscore = index + 1;
                        setState(() {});
                      }, 
                      icon: Icon(index < selectscore
                        ? Icons.star
                        : Icons.star_border,
                        color: Colors.amber,
                      ),
                    );
                  }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: reviewcontroller,
                          maxLength: 300,
                          maxLines: 3,
                          minLines: 1,
                      decoration: InputDecoration(
                        hintText: '평가를 입력해 주세요'
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => updatAction(), 
                    child: Text('저장'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } // build

  // --- Functions ---
  Future getImageFromGallery(ImageSource imageSource) async{
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if(pickedFile == null){
      return; // 선택한 이미지 없으면 돌아가기
    }else{
      imageFile = XFile(pickedFile.path);
      firstDisp = 1;
      setState(() {});
    }
  }

  updatAction()async{
    if(!isValidInput()){
      Get.snackbar('저장 실패', '모든 항목을 입력해 주세요');
      return;
    }
    // File 타입을 Byte 타입으로 변환
    Uint8List getImage;
    if (imageFile != null) {
      File imageFile1 = File(imageFile!.path);
      getImage = await imageFile1.readAsBytes();
    } else {
      getImage = value.image;
    }

    var eatplaceUpdate = EatPlace(
      id: value.id,
      latitude: lat, 
      longitude: long, 
      name: namecontroller.text, 
      tel: telcontroller.text, 
      score: selectscore, 
      review: reviewcontroller.text, 
      image: getImage,
      favorite: favorite,
    );

    int result = await handler.updateEatPlaceAll(eatplaceUpdate);
    if(result == 0){
      errorSnackbar();
    }else{
      Get.back();
      Get.back();
      successSnackbar();
    }
  }

  reloadLocation(value){
    lat = value['lat'];
    long = value['long'];
    setState(() {});
  }

  errorSnackbar(){
    Get.snackbar('저장 실패', '입력하신 내용을 다시 확인해 주세요');
  }

  successSnackbar(){
    Get.snackbar('저장 성공', '리스트를 수정했습니다');
  }

  bool isValidInput() {
  return (imageFile != null || value.image.isNotEmpty) &&
    lat != 0 && long != 0 &&
    namecontroller.text.trim().isNotEmpty &&
    telcontroller.text.trim().isNotEmpty &&
    reviewcontroller.text.trim().isNotEmpty &&
    selectscore > 0;
}

  Future<String> getAddressFromLatLng(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    Placemark place = placemarks[0];
    return '${place.locality} ${place.street}';
  }
} // class