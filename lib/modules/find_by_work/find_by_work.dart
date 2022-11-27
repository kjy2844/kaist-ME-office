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
  List<Work> worksWithPeople = works.getWorks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('find by work page'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(works.getImagePath())),
            SizedBox(
              width: 30,
            ),
            Container(
              width: 700,
              margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: worksWithPeople.length,
                itemBuilder: (context, index) {
                  return BasicTile(
                    title: worksWithPeople[index].title,
                    color: works.isClicked(index) ? Colors.blue : Colors.white,
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
        ));
  }
}
