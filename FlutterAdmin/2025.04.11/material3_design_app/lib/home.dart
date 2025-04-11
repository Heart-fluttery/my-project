import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material3 Design'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primary,
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Primary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary // on만 붙이면 보색
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.secondary,
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Secondary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondary // primary에 on만 붙이면 보색
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.tertiary,
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Tertiary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiary // on만 붙이면 보색
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.error,
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Error Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onError // on만 붙이면 보색
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.primaryContainer, // Container붙이면 연한색
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Primary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimaryContainer // on만 붙이면 보색
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Secondary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSecondaryContainer // primary에 on만 붙이면 보색
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Tertiary Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onTertiaryContainer // on만 붙이면 보색
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    color: Theme.of(context).colorScheme.errorContainer,
                    alignment: Alignment(0, 0),
                    child: Text(
                      'Error Color',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onErrorContainer // on만 붙이면 보색
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}