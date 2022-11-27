import 'package:flutter/material.dart';
import './documents.dart';
import '../common/basic_tile.dart';

Documents documents = Documents();

class FindByDocumentDetail extends StatefulWidget {
  const FindByDocumentDetail({Key? key}) : super(key: key);

  @override
  State<FindByDocumentDetail> createState() => _FindByDocumentDetailState();
}

class _FindByDocumentDetailState extends State<FindByDocumentDetail> {
  // TODO: 한, 영, 담장자 이름을 가지는 class 만들기
  List<Document> documentsWithPeople = documents.getDocuments();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('find by work page'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(documents.getImagePath())),
            SizedBox(
              width: 30,
            ),
            Container(
              width: 700,
              margin: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: documentsWithPeople.length,
                itemBuilder: (context, index) {
                  return BasicTile(
                    title: documentsWithPeople[index].title,
                    color:
                        documents.isClicked(index) ? Colors.blue : Colors.white,
                    click: () => setState(() {
                      documents.click(index);
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
