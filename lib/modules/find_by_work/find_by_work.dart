import 'package:flutter/material.dart';

class FindByWork extends StatefulWidget {
  const FindByWork({Key? key}) : super(key: key);

  @override
  State<FindByWork> createState() => _FindByWorkState();
}

class _FindByWorkState extends State<FindByWork> {
  List<String> works = [
    "강의실 비품/주차시스쳄/우편물",
    "고정자산",
    "공동장비",
    "교과과정/수업/조교",
    "교원인사",
    "국제협력/복수학위",
    "기계 가공실",
    "대학원 입시/박사자격시험",
    "산학협력",
    "석박사과정/학위논문",
    "시설(N25)",
    "시설(N7)",
    "시설(M9)",
    "연구비",
    "연구실 안전관리",
    "출장/카드키/세미나실",
    "학부 제작실",
    "학부실험실습(기계가공, 기계공학실험)",
    "학부실험실습(기계제도)",
    "학부실험실습(자동제어, 시모제)",
    "학부실험실습(창시구, 공학설계메카, 응용전자공학)",
    "학사과정/학생포상/장학/별정직",
    "홍보",
    "3D 프린터 및 레이저 가공실",
    "A/V System",
    "BK21/전문연구요원",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('find by work page'),
        ),
        body: Row(
          children: [
            Container(
              child: Text('left'),
            ),
            Container(
              width: 700,
              margin: EdgeInsets.all(10),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: works.length,
                itemBuilder: (context, index) {
                  return WorkListTile(title: works[index]);
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
  }) : super(key: key);

  final String title;

  @override
  State<WorkListTile> createState() => _WorkListTileState();
}

class _WorkListTileState extends State<WorkListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 59,
      width: 479,
      decoration: BoxDecoration(
        color: Colors.white,
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
    );
  }
}
