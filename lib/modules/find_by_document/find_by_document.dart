import 'package:flutter/material.dart';
import 'package:me_office/modules/common/basic_tile.dart';
import 'package:me_office/modules/common/common_text.dart';
import 'package:me_office/modules/common/constants.dart';
import 'package:me_office/modules/find_by_document/criteria.dart';
import '../common/common_app_bar.dart';

class FindByDocument extends StatefulWidget {
  const FindByDocument({Key? key}) : super(key: key);

  @override
  State<FindByDocument> createState() => _FindByDocumentState();
}

class _FindByDocumentState extends State<FindByDocument> {
  List<Criterion> criteriaList = Criteria.getCriteria();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Criteria.initialize();
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    final screenHeight = data.size.height;
    final screenWidth = data.size.width;

    return Scaffold(
      appBar: CommonAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                find_a_contact_by_submission_document.getString(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Container(
            height: screenHeight * 0.65,
            width: screenWidth * 0.8,
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: screenHeight * 0.15,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
              ),
              itemCount: criteriaList.length,
              itemBuilder: (BuildContext context, int index) {
                return BasicTile(
                    title: criteriaList[index].title,
                    color: Criteria.isClicked(index) ? kaistBlue : Colors.white,
                    fontColor:
                        Criteria.isClicked(index) ? Colors.white : Colors.black,
                    click: () {
                      setState(() {
                        Criteria.click(index);
                      });
                      // TODO: detail page에 선택한 criteria 전달? 혹은 criteria에 맞춰서 detail에 뜰 document list 받아오기
                      Navigator.pushNamed(context, '/find-by-document-detail')
                          .then((_) {
                        setState(() {
                          Criteria.initialize();
                        });
                      });
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
