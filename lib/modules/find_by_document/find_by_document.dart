import 'package:flutter/material.dart';
import 'package:me_office/modules/common/basic_tile.dart';
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
    return Scaffold(
      appBar: CommonAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '제출 서류별 담당자 찾기',
                style: TextStyle(fontSize: 48),
              ),
            ),
          ),
          Center(
            child: Container(
              height: 800,
              width: 1400,
              padding: EdgeInsets.all(90.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 150,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 20,
                ),
                itemCount: criteriaList.length,
                itemBuilder: (BuildContext context, int index) {
                  return BasicTile(
                      title: criteriaList[index].title,
                      color:
                          Criteria.isClicked(index) ? kaistBlue : Colors.white,
                      fontColor: Criteria.isClicked(index)
                          ? Colors.white
                          : Colors.black,
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
          ),
        ],
      ),
    );
  }
}
