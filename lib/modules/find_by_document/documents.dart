import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:me_office/modules/common/person.dart';
import 'package:me_office/modules/find_by_document/criteria.dart';

import '../common/language.dart';

class Document {
  String title_kor;
  String title_eng;
  List<Person> people;

  Document(this.title_kor, this.title_eng, this.people);

  factory Document.fromJson(Map<String, dynamic> json) {
    List<Person> peopleList =
        json['people'].map<Person>((json) => Person.fromJson(json)).toList();
    return Document(json['title_kor'], json['title_eng'], peopleList);
  }
}

class Documents {
  List<Document> documentsWithPeople = [];

  int clicked = -1;

  Future<List<Document>> getDocuments(
      int index, String start, String end) async {
    final String response =
        await rootBundle.loadString('assets/json/documents_data.json');
    final data = json.decode(response).cast<Map<String, dynamic>>();

    if (Language.getCurLang() == LanguageType.Kor) {
      if (index == 7) {
        this.documentsWithPeople = data
            .map<Document>((json) => Document.fromJson(json))
            .where((element) =>
                start.compareTo(element.title_kor[0]) > 0 ||
                end.compareTo(element.title_kor[0]) < 0)
            .toList();
      } else {
        this.documentsWithPeople = data
            .map<Document>((json) => Document.fromJson(json))
            .where((element) =>
                start.compareTo(element.title_kor[0]) <= 0 &&
                end.compareTo(element.title_kor[0]) >= 0)
            .toList();
      }
      this
          .documentsWithPeople
          .sort((a, b) => a.title_kor.compareTo(b.title_kor));
    } else if (Language.getCurLang() == LanguageType.Eng) {
      this.documentsWithPeople = data
          .map<Document>((json) => Document.fromJson(json))
          .where((element) =>
              start.compareTo(element.title_eng[0]) <= 0 &&
              end.compareTo(element.title_eng[0]) >= 0)
          .toList();
      this
          .documentsWithPeople
          .sort((a, b) => a.title_eng.compareTo(b.title_eng));
    }

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

  List<String> getImagePaths() {
    if (this.clicked == -1) {
      return ['assets/images/seat_before_example.png'];
    } else {
      return this
          .documentsWithPeople[this.clicked]
          .people
          .map((e) => 'assets/images/' + e.image)
          .toList();
    }
  }

  void initialize() {
    this.clicked = -1;
  }

  String getTitle(int index) {
    if (Language.getCurLang() == LanguageType.Kor) {
      return this.documentsWithPeople[index].title_kor;
    } else if (Language.getCurLang() == LanguageType.Eng) {
      return this.documentsWithPeople[index].title_eng;
    } else {
      return "";
    }
  }
}
