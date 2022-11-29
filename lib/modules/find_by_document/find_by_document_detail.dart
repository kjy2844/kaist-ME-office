import 'package:flutter/material.dart';
import 'package:me_office/modules/find_by_document/criteria.dart';
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
  // Future<List<Document>> documentsWithPeople = documents.getDocuments();

  @override
  Widget build(BuildContext context) {
    final criteria = ModalRoute.of(context)!.settings.arguments as Criteria;
    int clickedIndex = criteria.clicked;
    Criterion criterion = criteria.getCriterion(clickedIndex);
    String clickedLabel = criterion.title;

    List<String> imagePaths = documents.getImagePaths();

    return FutureBuilder(
        future: documents.getDocuments(
            clickedIndex, criterion.start, criterion.end),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error!'),
            );
          } else {
            List<Document> data = snapshot.data ?? [];

            return Scaffold(
                appBar: AppBar(
                  title: Text('find by work page $clickedLabel'),
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
                              child:
                                  Image(image: AssetImage(imagePaths[index]))),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 700,
                      margin:
                          EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return BasicTile(
                            title: data[index].title,
                            color: documents.isClicked(index)
                                ? Colors.blue
                                : Colors.white,
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
        });
  }
}
