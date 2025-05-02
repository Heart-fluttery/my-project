import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqlite_image_app/model/address.dart';
import 'package:sqlite_image_app/vm/database_handler.dart';

class UpdateAddress extends StatefulWidget {
  const UpdateAddress({super.key});

  @override
  State<UpdateAddress> createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  // Property
  late DatabaseHandler handler;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  late TextEditingController relationController;

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  var value = Get.arguments ?? "__";

  late int firstDisp;

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    addressController = TextEditingController();
    relationController = TextEditingController();
    
    nameController.text = value[1];
    phoneController.text = value[2];
    addressController.text = value[3];
    relationController.text = value[4];

    firstDisp = 0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주소록 수정'),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: '이름'),
            ),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: '전화번호'),
            ),
            TextField(
              controller: addressController,
              decoration: InputDecoration(labelText: '주소'),
            ),
            TextField(
              controller: relationController,
              decoration: InputDecoration(labelText: '관계'),
            ),
            ElevatedButton(
              onPressed: () => getImageFromGallery(ImageSource.gallery), 
              child: Text('Gallery'),
            ),
            firstDisp == 0
            ? Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.grey,
              child: Center(
                child: Image.memory(value[5]),
                // snapshot에서 받은 이미지라 memory
              ),
            )
            :Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.grey,
              child: Center(
                child: imageFile == null
                ? Text('Image is not selected!')
                : Image.file(File(imageFile!.path))
                // 갤러리에서 받았을 때는 타입이 다름
                ,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if(firstDisp == 0){
                  updateAction();
                }else{
                  updateActionAll();
                }
              }, 
              child: Text('수정'),
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Functions ---
  Future getImageFromGallery(ImageSource imageSource) async{
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if(pickedFile == null){
      return;
    }else{
      imageFile = XFile(pickedFile.path);
      firstDisp += 1;
      setState(() {});
    }
  }

  updateAction()async{
    var addressUpdate = Address(
      id: value[0],
      name: nameController.text, 
      phone: phoneController.text, 
      address: addressController.text, 
      relation: relationController.text,
      image: value[5]
      );

      int result = await handler.updateAddress(addressUpdate);
      if(result == 0){
        // errosnackbar
      }else{
        _showDialog();
      }
  }

  updateActionAll()async{
    // File Type을 Byte Type으로 변환
    File imageFile1 = File(imageFile!.path);
    Uint8List getImage = await imageFile1.readAsBytes();

    var addressUpdate = Address(
      id: value[0],
      name: nameController.text, 
      phone: phoneController.text, 
      address: addressController.text, 
      relation: relationController.text, 
      image: getImage);

      int result = await handler.insertAddress(addressUpdate);
      if(result == 0){
        // errosnackbar
      }else{
        _showDialog();
      }
  }

  _showDialog(){
    Get.defaultDialog(
      title: '수정 완료',
      middleText: '수정이 완료 되었습니다',
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      barrierDismissible: false,
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
            Get.back();
          }, 
          child: Text('OK'),
        ),
      ]
    );
  }
} // class