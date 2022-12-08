import 'package:flutter/material.dart';
import 'package:me_office/modules/common/common_app_bar.dart';
import 'package:me_office/modules/common/common_text.dart';
import 'package:me_office/modules/common/constants.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    documents.initialize();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenHeight = data.size.height;
    final screenWidth = data.size.width;

    final halfWidth = screenWidth * 0.4;

    int clickedIndex = Criteria.getClicked();
    Criterion criterion = Criteria.getCriterion(clickedIndex);
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
                appBar: CommonAppBar(),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          find_a_contact_by_submission_document.getString() +
                              '($clickedLabel)',
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
                          margin: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return BasicTile(
                                title: documents.getTitle(index),
                                color: documents.isClicked(index)
                                    ? kaistBlue
                                    : Colors.white,
                                fontColor: documents.isClicked(index)
                                    ? Colors.white
                                    : Colors.black,
                                click: () => setState(() {
                                  documents.click(index);
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
                ));
          }
        });
  }
}
