import 'package:flutter/material.dart';
import 'package:me_office/modules/common/basic_tile.dart';
import 'package:me_office/modules/find_by_document/criteria.dart';

Criteria criteria = Criteria();

class FindByDocument extends StatefulWidget {
  const FindByDocument({Key? key}) : super(key: key);

  @override
  State<FindByDocument> createState() => _FindByDocumentState();
}

class _FindByDocumentState extends State<FindByDocument> {
  List<Criterion> criteriaList = criteria.getCriteria();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    criteria.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('find by document page'),
      ),
      body: Center(
        child: Container(
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
                  color: criteria.isClicked(index) ? Colors.blue : Colors.white,
                  click: () {
                    setState(() {
                      criteria.click(index);
                    });
                    // TODO: detail page에 선택한 criteria 전달? 혹은 criteria에 맞춰서 detail에 뜰 document list 받아오기
                    Navigator.pushNamed(context, '/find-by-document-detail',
                            arguments: criteria)
                        .then((_) {
                      setState(() {
                        criteria.initialize();
                      });
                    });
                  });
            },
          ),
        ),
      ),
    );
  }
}
