import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  const MySnackBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed:
                    () => snackBarFunction(
                      context,
                      'Elevated Button is clicked.',
                      Colors.red,
                      5,
                    ), // 매개변수 context
                // (){} 구조로 함수를 바로 적지 않고 () => 로 함수에 연결할 수 있음
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.from(
                    alpha: 1,
                    red: 1,
                    green: 0.871,
                    blue: 0.404,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Snackbar Button'),
              ),
              ElevatedButton(
                onPressed:
                    () => snackBarFunction(context, '버튼이 눌렸습니다.', Colors.blue, 2),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.from(
                    alpha: 1,
                    red: 1,
                    green: 0.871,
                    blue: 0.404,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Snackbar Button'),
              ),
            ],
          ),
        ],
      ),
    );
  } // build
  
  // ---- Functions ---- //
  snackBarFunction(BuildContext context,String message,Color colors,int secon,) {
    // 매개변수넣고 타입도 정해줘야함
    ScaffoldMessenger.of(context).showSnackBar(
      // of는 showSnackBar 메모리가 들어갈 공간 생성
      SnackBar(
        content: Text(message, style: TextStyle(color: Colors.black)),
        backgroundColor: colors,
        duration: Duration(seconds: secon), // 노출 시간
      ),
    );
  }
} // MySnackBar
