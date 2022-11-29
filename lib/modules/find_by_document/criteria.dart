import 'package:me_office/modules/find_by_document/criteria.dart';

class Criterion {
  String title;
  String start;
  String end;

  Criterion(this.title, this.start, this.end);
}

class Criteria {
  // TODO: 영문명 처리
  List<Criterion> criteria = [
    Criterion("ㄱ~ㄴ", "가", "닣"),
    Criterion("ㄷ~ㄹ", "다", "맇"),
    Criterion("ㅁ~ㅂ", "마", "빟"),
    Criterion("ㅅ~ㅇ", "사", "잏"),
    Criterion("ㅈ~ㅊ", "자", "칳"),
    Criterion("ㅋ~ㅌ", "카", "팋"),
    Criterion("ㅍ~ㅎ", "파", "힣"),
    Criterion("기타", "가", "힣"),
  ];

  int clicked = -1;

  List<Criterion> getCriteria() {
    return this.criteria;
  }

  Criterion getCriterion(int index) {
    return this.criteria[index];
  }

  void click(int index) {
    if (this.clicked == index) {
      this.clicked = -1;
    } else {
      this.clicked = index;
    }
  }

  bool isClicked(int index) {
    return this.clicked == index;
  }
}
