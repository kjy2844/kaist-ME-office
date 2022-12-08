import 'package:flutter/material.dart';
import 'package:me_office/modules/common/common_app_bar.dart';
import 'package:me_office/modules/common/common_text.dart';
import 'package:me_office/modules/common/constants.dart';
import './works.dart';
import '../common/basic_tile.dart';

Works works = Works();

class FindByWork extends StatefulWidget {
  const FindByWork({Key? key}) : super(key: key);

  @override
  State<FindByWork> createState() => _FindByWorkState();
}

class _FindByWorkState extends State<FindByWork> {
  // TODO: 한, 영, 담장자 이름을 가지는 class 만들기
  Future<List<Work>> worksWithPeople = works.getWorks();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    works.initialize();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenHeight = data.size.height;
    final screenWidth = data.size.width;

    final halfWidth = screenWidth * 0.4;

    List<String> imagePaths = works.getImagePaths();

    return FutureBuilder(
        future: worksWithPeople,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error!'),
            );
          } else {
            List<Work> data = snapshot.data ?? [];
            return Scaffold(
              appBar: CommonAppBar(),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        find_a_contact_by_task.getString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: halfWidth,
                        height: screenHeight * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: List<Widget>.generate(
                            imagePaths.length,
                            (index) => Flexible(
                                fit: FlexFit.loose,
                                child: Image(
                                    image: AssetImage(imagePaths[index]))),
                          ),
                        ),
                      ),
                      Container(
                        width: halfWidth,
                        height: screenHeight * 0.7,
                        margin:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return BasicTile(
                              title: works.getTitle(index),
                              color: works.isClicked(index)
                                  ? kaistBlue
                                  : Colors.white,
                              fontColor: works.isClicked(index)
                                  ? Colors.white
                                  : Colors.black,
                              click: () => setState(() {
                                works.click(index);
                              }),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: screenHeight * 0.01,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
        });
  }
}
