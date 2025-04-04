import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onLongPress: () => print("Long"),//Ctrl+스페이스바 눌러서 => 팻애로우 만들면 한 줄만
              //쓴다는 의미, 세미콜론 쓰지 않아도 됨, 밑에 중괄호는 여러줄 쓴다는 의미
              onPressed:  () {
                int intNum1 = 10;
                int intNum2 = 20;
                print("$intNum1 + $intNum2 = ${intNum1 + intNum2}");
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.red
              ),
              child: Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => print("Elevated Button"),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.yellow,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)//테두리 깎는 기능
                )
              ),
              child: Text('Eleveated Button'),
              ),
              OutlinedButton(
                onPressed: () => print('Outlined Button'),
                style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green,
                backgroundColor: Colors.white,
                side: BorderSide(
                  color: Colors.black,
                  width: 2.0
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)//테두리 깎는 기능
                ),
                ),
                child: Text('Outlined Button'),
              ),
              TextButton.icon(
                onPressed: () => print("text button icon"),
                icon: Icon(
                  Icons.home,
                  size: 40,
                  color: Colors.red,
                ),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.black
                ),
                label: Text('Go to home'),
                ),
                ElevatedButton.icon(
                  onPressed: () => print('ElevatedButton Pressed'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    minimumSize: Size(150, 40)
                  ),
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  label: Text('Go to home'),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => print("Go to home pressed"),
                    label: Text("Go to home"),
                    ),
          ],
        ),
      ),
    );
  }
}