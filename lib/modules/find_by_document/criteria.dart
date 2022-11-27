class Criteria {
  // TODO: 영문명 처리
  List<String> criteria = [
    "ㄱ~ㄴ",
    "ㄷ~ㄹ",
    "ㅁ~ㅂ",
    "ㅅ~ㅇ",
    "ㅈ~ㅊ",
    "ㅋ~ㅌ",
    "ㅍ~ㅎ",
    "기타",
  ];

  int clicked = -1;

  List<String> getCriteria() {
    return this.criteria;
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
