import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class InsertAddress extends StatefulWidget {
  const InsertAddress({super.key});

  @override
  State<InsertAddress> createState() => _InsertAddressState();
}

class _InsertAddressState extends State<InsertAddress> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController relationController = TextEditingController();

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();

  String filename = ""; // ImagePicker에서 선택된 filename


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('주소록 입력'),
      ),
      body: Center(
        child: Column(
          children: [
            _buildTextField(nameController, "이름을 입력하세요"),
            _buildTextField(phoneController, "전화번호를 입력하세요"),
            _buildTextField(addressController, "주소를 입력하세요"),
            _buildTextField(relationController, "관계를 입력하세요"),
            ElevatedButton(
              onPressed: () => getImageFromGallery(ImageSource.gallery), 
              child: Text('이미지 가져오기'),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              color: Colors.grey,
              child: Center(
                child: imageFile == null
                ? Text('이미지가 선택되지 않았습니다.')
                : Image.file(File(imageFile!.path)),
              ),
            ),
            ElevatedButton(
              onPressed: () => insertAction(), 
              child: Text('입력'),
            ),
          ],
        ),
      ),
    );
  } // build

  // --- Widgets ---
  Widget _buildTextField(TextEditingController controller, String labelText){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(labelText: labelText),
      ),
    );
  }


  // --- Functions ---
  getImageFromGallery(ImageSource imageSource)async{
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    imageFile = XFile(pickedFile!.path);
    setState(() {});
  }

  insertAction()async{
    var request = http.MultipartRequest(
      "POST", 
      Uri.parse("http://127.0.0.1:8000/insert")
    );
    request.fields['name'] = nameController.text;
    request.fields['phone'] = phoneController.text;
    request.fields['address'] = addressController.text;
    request.fields['relation'] = relationController.text;
    if(imageFile != null){
      request.files.add(await http.MultipartFile.fromPath('file', imageFile!.path));
    }
    var res = await request.send();
    if(res.statusCode == 200){
      showDialog();
    }else{
      errorSnackBar();
    }
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