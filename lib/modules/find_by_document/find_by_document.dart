import 'package:flutter/material.dart';

class FindByDocument extends StatefulWidget {
  const FindByDocument({Key? key}) : super(key: key);

  @override
  State<FindByDocument> createState() => _FindByDocumentState();
}

class _FindByDocumentState extends State<FindByDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('find by document page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
