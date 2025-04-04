import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Text with Column Row2',
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
          ),
          backgroundColor: Colors.amber,
          centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Icon(Icons.email_rounded),
                    Text('James'),
                    Column(
                      children: [
                        Icon(Icons.mail_rounded)
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_circle)
                      ],
                    ),
                    Column(
                      children: [
                        Icon(Icons.account_balance)
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.account_circle),
                    Text('Cathy'),
                    Column(
                      children: [
                        Text('James'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        children: [
                          Text('Cathy'),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text('Kenny'),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.account_balance),
                    Text('Kenny')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}