import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String buttonText;
  late Color buttonColor;
  late double size;

  @override
  void initState() {
    super.initState();
    buttonText = 'Hello';
    buttonColor = Colors.blueAccent;
    size = 250;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change button color & text'),
        centerTitle: false,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
              child: Image.asset('images/201157139.jpeg',
              width: size,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                onPressed: () => _sizeClick(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),minimumSize: Size(130, 40)
                ),
                child: Text("Up & Down",
                style: TextStyle(
                  color: Colors.white
                ),),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ElevatedButton(
                  onPressed: () => _onClick(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),minimumSize: Size(130, 40)
                  ),
                  child: Text(buttonText,
                  style: TextStyle(
                    color: Colors.white
                  ),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  _onClick(){
    buttonText == 'Hello' ? {buttonText = 'Flutter', buttonColor = Colors.amberAccent} : 
    {buttonText = 'Hello', buttonColor = Colors.blueAccent};
    setState(() {});
  }

  _sizeClick(){
    size = buttonColor == Colors.blueAccent ? size - 10 : size + 10;
    setState(() {});
  }
}