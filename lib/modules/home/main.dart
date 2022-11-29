import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference works = firestore.collection('works');

    // return FutureBuilder<DocumentSnapshot>(
    //   future: works.doc('XwzIaQVndvkRLUwfXLoc').get(),
    //   builder:
    //       (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
    //     if (snapshot.hasError) {
    //       return Text("Something went wrong");
    //     }
    //
    //     if (snapshot.hasData && !snapshot.data!.exists) {
    //       return Text("Document does not exist");
    //     }
    //
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       Map<String, dynamic> data =
    //           snapshot.data!.data() as Map<String, dynamic>;
    //       return Text("${data}");
    //     }
    //
    //     return Text("loading");
    //   },
    // );
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
