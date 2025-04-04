import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Mymessage extends StatelessWidget {
  const Mymessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Column(
            children: [
              ElevatedButton(
                onPressed: () => toastButton(context, ToastGravity.TOP,"Toast Message 1", Colors.redAccent),
                child: Text('Toast1'),
                ),
              ElevatedButton(
                onPressed: () => toastButton(context, ToastGravity.BOTTOM,"Toast Message 2", Colors.blueAccent),
                child: Text('Toast2'),
                ),
            ],
          ),
        ],
      ),
    );
  } // build

    toastButton(BuildContext context, ToastGravity way, String message, Color color){
    Fluttertoast.showToast(
    msg: message,
    gravity: way,
    backgroundColor: color,
    toastLength: Toast.LENGTH_SHORT
    );
    }
} // Mymessage