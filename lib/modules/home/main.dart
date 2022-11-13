import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/find-by-work');
              },
              child: const Text('Find By Work!'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/find-by-document');
              },
              child: const Text('Find By Document!'),
            ),
          ],
        ),
      ),
    );
  }
}
