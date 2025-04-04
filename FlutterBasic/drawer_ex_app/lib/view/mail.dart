import 'package:flutter/material.dart';

class Mail extends StatelessWidget {
  const Mail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mail',
        style: TextStyle(
          color: Colors.white,
        ),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () => gosendmail(context),
            icon: Icon(Icons.email),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () => goreceivemail(context),
            icon: Icon(Icons.email_outlined),
            color: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
            onPressed: () => gosendmail(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              )
            ),
            child: Text("보낸 편지함",
            style: TextStyle(
              color: Colors.white
            ),),
          ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: ElevatedButton(
              onPressed: () => goreceivemail(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
              ),
              child: Text("받은 편지함",
              style: TextStyle(
                color: Colors.white
              ),),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/201157139.jpeg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/201157139.jpeg'),
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/201157139.jpeg'),
                ),
              ],
              accountName: Text('Heart-Flutter'),
              accountEmail: Text('heartflutter@gmail.com'),
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)
                )
              ),
              ),
              ListTile(
                leading: Icon(
                  Icons.mail,
                  color: Colors.blueAccent,
                ),
                onTap: () => gosendmail(context),
                title: Text("보낸 메일함"),
              ),
              ListTile(
                leading: Icon(
                  Icons.mail_outline,
                  color: Colors.redAccent,
                ),
                onTap: () => goreceivemail(context),
                title: Text("받은 메일함"),
              ),
          ],
        ),
      ),
    );
  } // build
  // ---- Function ----
  gosendmail(context){
    Navigator.pushNamed(context, '/send');
  }
  goreceivemail(context){
    Navigator.pushNamed(context, '/receive');
  }
} // Mail