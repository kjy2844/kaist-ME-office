class Document {
  String title;
  List<String> people;

  Document(this.title, this.people);
}

class Documents {
  List<Document> documentsWithPeople = [
    Document("강의실 비품/주차시스쳄/우편물", ["기계과"]),
    Document("고정자산", ["기계과"]),
    Document("공동장비", ["기계과"]),
    Document("교과과정/수업/조교", ["기계과"]),
    Document("교원인사", ["기계과"]),
    Document("국제협력/복수학위", ["기계과"]),
    Document("기계 가공실", ["기계과"]),
    Document("대학원 입시/박사자격시험", ["기계과"]),
    Document("산학협력", ["기계과"]),
    Document("석박사과정/학위논문", ["기계과"]),
    Document("시설(N25)", ["기계과"]),
    Document("시설(N7)", ["기계과"]),
    Document("시설(M9)", ["기계과"]),
    Document("연구비", ["기계과"]),
    Document("연구실 안전관리", ["기계과"]),
    Document("출장/카드키/세미나실", ["기계과"]),
    Document("학부 제작실", ["기계과"]),
    Document("학부실험실습(기계가공, 기계공학실험)", ["기계과"]),
    Document("학부실험실습(기계제도)", ["기계과"]),
    Document("학부실험실습(자동제어, 시모제)", ["기계과"]),
    Document("학부실험실습(창시구, 공학설계메카, 응용전자공학)", ["기계과"]),
    Document("학사과정/학생포상/장학/별정직", ["기계과"]),
    Document("홍보", ["기계과"]),
    Document("3D 프린터 및 레이저 가공실", ["기계과"]),
    Document("A/V System", ["기계과"]),
    Document("BK21/전문연구요원", ["기계과"]),
  ];

  int clicked = -1;

  List<Document> getDocuments() {
    return this.documentsWithPeople;
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

  String getImagePath() {
    if (this.clicked == -1) {
      return 'images/seat_before_example.png';
    } else {
      return 'images/seat_after_example.png';
    }
  }
}
