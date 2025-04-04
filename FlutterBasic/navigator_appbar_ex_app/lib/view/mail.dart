import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text('Navigator AppBar'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => sendFunction(context),
            icon: Icon(Icons.email),
            ),
          IconButton(
            onPressed: () => receiveFunction(context),
            icon: Icon(Icons.email),
            ),
        ],
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: ElevatedButton(
                  onPressed: () => sendFunction(context),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: Colors.lightGreen
                  ),
                  child: Text('보낸 편지함',
                  style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),
              ElevatedButton(
                onPressed: () => receiveFunction(context),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  backgroundColor: Colors.redAccent
                ),
                child: Text('받은 편지함',
                style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ],
          ),
          ],
        ),
      ),
    );
  } // build

  // --- Functions --- 
  sendFunction(BuildContext context){
    Navigator.pushNamed(context, '/send');
  }

  receiveFunction(BuildContext context){
    Navigator.pushNamed(context, '/receive');
  }

  mailFunction(BuildContext context, String part){ // 수업이라 한거고 if는 느려서 안좋음 위같이 할것
    if (part == 'send') {
      Navigator.pushNamed(context, '/send');
    }else{
      Navigator.pushNamed(context, '/receive');
    }
  }
} // Mail