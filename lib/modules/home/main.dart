import 'package:flutter/material.dart';
import 'package:me_office/modules/common/constants.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import '../common/common_app_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;
    // CollectionReference works = firestore.collection('works');

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
      appBar: CommonAppBar(),
      body: Center(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: 800,
              width: 600,
              // color: kaistBlue,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/kaist_night.png'),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/find-by-work');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, fixedSize: Size(520, 460)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: Icon(
                          Icons.people_outline,
                          color: kaistBlue,
                          size: 130,
                        ),
                      ),
                      const Text(
                        '업무별 담당자 찾기',
                        style: TextStyle(
                          fontSize: 40,
                          color: kaistBlue,
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/find-by-document');
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kaistBlue, fixedSize: Size(520, 460)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 40.0),
                        child: Icon(
                          Icons.article_outlined,
                          color: Colors.white,
                          size: 130,
                        ),
                      ),
                      const Text(
                        '제출 서류별 담당자 찾기',
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                        ),
                      ),
                    ],
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
