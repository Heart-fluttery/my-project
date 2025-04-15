import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailImage extends StatefulWidget {
  const DetailImage({super.key});

  @override
  State<DetailImage> createState() => _DetailImageState();
}

class _DetailImageState extends State<DetailImage> {
  late String imageText;

  @override
  void initState() {
    super.initState();
    imageText = Get.arguments ?? "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(imageText.substring(7)),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            imageText,
            width: 300,
          ),
        ),
      ),
    );
  }
}