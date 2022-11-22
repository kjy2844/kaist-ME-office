import 'package:flutter/material.dart';
import './works.dart';

Works works = Works();

class FindByWork extends StatefulWidget {
  const FindByWork({Key? key}) : super(key: key);

  @override
  State<FindByWork> createState() => _FindByWorkState();
}

class _FindByWorkState extends State<FindByWork> {
  // TODO: 한, 영, 담장자 이름을 가지는 class 만들기
  List<Work> worksWithPeople = works.getWorks();
  int clicked = -1;

  String getImagePath() {
    if (clicked == -1) {
      return 'images/seat_before_example.png';
    } else {
      return 'images/seat_after_example.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('find by work page'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(getImagePath())),
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
                  return WorkListTile(
                    title: worksWithPeople[index].title,
                    color: clicked == index ? Colors.blue : Colors.white,
                    click: () => setState(() {
                      if (clicked == index) {
                        clicked = -1;
                      } else {
                        clicked = index;
                      }
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

class WorkListTile extends StatefulWidget {
  const WorkListTile({
    Key? key,
    required this.title,
    required this.color,
    required this.click,
  }) : super(key: key);

  final String title;
  final Color color;
  final Function click;

  @override
  State<WorkListTile> createState() => _WorkListTileState();
}

class _WorkListTileState extends State<WorkListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          // TODO: 이벤트로 위쪽에 이 위젯이 클릭되었다는 것을 전달 or 이 위젯을 여기서 InkWell로 감싸지 말고 상위 위젯에서 감쌀수도 있을 듯
          widget.click();
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 59,
        width: 479,
        decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(
            color: Color(0xFFD9D9D9),
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xCFD9D9D9),
              blurRadius: 10.0, // soften the shadow
              spreadRadius: 0.0, //extend the shadow
              offset: Offset(
                4.0, // Move to right horizontally
                4.0, // Move to bottom Vertically
              ),
            )
          ],
        ),
        child: Text(
          widget.title,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
