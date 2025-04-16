import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  XFile? imageFile; // 이미지를 선택 안하면 null이라 널세이프티
  final ImagePicker picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery & Camera'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        getImageFromDevice(ImageSource.gallery);
                      }, 
                      child: Text('Gallery'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: ElevatedButton(
                      onPressed: () {
                        getImageFromDevice(ImageSource.camera);
                      }, 
                      child: Text('Camara'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Center(
                child: imageFile == null
                ? Text('Image is not Selected')
                : Image.file(File(imageFile!.path)), 
                // 갤러리에서 가져오는거라 Image.file, imagepicker는 파일 경로를 부름 
              ),
            )
          ],
        ),
      ),
    );
  } // build

  // --- Function ---
  getImageFromDevice(ImageSource ImageSource)async{ // 이미지 소스 타입의 변수 생성
    final XFile? pickedFile = await picker.pickImage(source: ImageSource);
    // 갤러리든 카메라든 이미지소스를 pickedFile에 넣을 때까지 기다림
    if(pickedFile == null){
      imageFile = null;
    }else{
      imageFile = XFile(pickedFile.path);
    }
    setState(() {});
  }
} // class