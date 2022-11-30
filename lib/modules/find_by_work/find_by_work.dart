import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
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
              appBar: AppBar(
                title: Text('find by work page'),
              ),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 700,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List<Widget>.generate(
                        imagePaths.length,
                        (index) => Flexible(
                            fit: FlexFit.loose,
                            child: Image(image: AssetImage(imagePaths[index]))),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 700,
                    margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return BasicTile(
                          title: data[index].title,
                          color: works.isClicked(index)
                              ? Colors.blue
                              : Colors.white,
                          click: () => setState(() {
                            works.click(index);
                          }),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
