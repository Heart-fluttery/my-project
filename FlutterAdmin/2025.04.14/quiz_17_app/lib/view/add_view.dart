import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_17_app/model/listmodel.dart';
import 'package:quiz_17_app/model/staticdata.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  // Property
  late List<IconData> iconList;
  late int selectedIcon;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    iconList = [
      Icons.edit,
      Icons.shopping_cart,
      Icons.timer,
    ];
    selectedIcon = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconList[selectedIcon]),
                SizedBox(
                  width: 250,
                  height: 200,
                  child: CupertinoPicker(
                    itemExtent: 50, 
                    onSelectedItemChanged: (value) {
                      selectedIcon = value;
                      setState(() {});
                    }, 
                    children: List.generate(
                      iconList.length, 
                      (index) => Center(
                        child: Icon(
                          iconList[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: '목록을 입력하세요'
              ),
            ),
            ElevatedButton(
              onPressed: () {
                dataAdd();
              }, 
              child: Text('OK'),
            ),
          ],
        ),
      ),
    );
  }
  dataAdd(){
    Staticdata.staticlist.add(Listmodel(showIcon: iconList[selectedIcon], text: textEditingController.text.trim()));
    selectedIcon = 0;
    textEditingController.clear();
    Get.back();
  }
}