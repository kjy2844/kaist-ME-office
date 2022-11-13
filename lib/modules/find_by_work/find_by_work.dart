import 'package:flutter/material.dart';

class FindByWork extends StatefulWidget {
  const FindByWork({Key? key}) : super(key: key);

  @override
  State<FindByWork> createState() => _FindByWorkState();
}

class _FindByWorkState extends State<FindByWork> {
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
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    child: Text('강의실 비품/주차시스쳄/우편물'),
                  ),
                  Container(
                    child: Text('고정자산'),
                  ),
                  Container(
                    child: Text('공동장비'),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
