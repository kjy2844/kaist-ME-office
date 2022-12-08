import 'package:flutter/material.dart';
import 'package:me_office/modules/common/constants.dart';
import '../common/common_app_bar.dart';
import '../common/common_text.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenHeight = data.size.height;
    final screenWidth = data.size.width;

    final boxHeight = screenHeight * 0.55;
    final boxWidth = screenHeight * 0.5;
    final iconSize = boxWidth * 0.3;
    final intervalSize = boxHeight * 0.1;

    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              height: screenHeight * 0.7,
              width: screenWidth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/kaist_night.png'),
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
                    backgroundColor: Colors.white,
                    fixedSize: Size(boxHeight, boxWidth),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_outline,
                        color: kaistBlue,
                        size: iconSize,
                      ),
                      SizedBox(
                        height: intervalSize,
                      ),
                      Text(
                        find_a_contact_by_task.getString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
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
                    backgroundColor: kaistBlue,
                    fixedSize: Size(boxHeight, boxWidth),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.article_outlined,
                        color: Colors.white,
                        size: iconSize,
                      ),
                      SizedBox(
                        height: intervalSize,
                      ),
                      Text(
                        find_a_contact_by_submission_document.getString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
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
