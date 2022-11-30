import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:me_office/modules/common/person.dart';
import 'package:me_office/modules/find_by_document/criteria.dart';

class Document {
  String title;
  List<Person> people;

  Document(this.title, this.people);

  factory Document.fromJson(Map<String, dynamic> json) {
    List<Person> peopleList =
        json['people'].map<Person>((json) => Person.fromJson(json)).toList();
    return Document(json['title'], peopleList);
  }
}

class Documents {
  List<Document> documentsWithPeople = [];

  int clicked = -1;

  Future<List<Document>> getDocuments(
      int index, String start, String end) async {
    final String response =
        await rootBundle.loadString('json/documents_data.json');
    final data = json.decode(response).cast<Map<String, dynamic>>();

    if (index == 7) {
      this.documentsWithPeople = data
          .map<Document>((json) => Document.fromJson(json))
          .where((element) =>
              start.compareTo(element.title[0]) > 0 ||
              end.compareTo(element.title[0]) < 0)
          .toList();
    } else {
      this.documentsWithPeople = data
          .map<Document>((json) => Document.fromJson(json))
          .where((element) =>
              start.compareTo(element.title[0]) <= 0 &&
              end.compareTo(element.title[0]) >= 0)
          .toList();
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
      return ['images/seat_before_example.png'];
    } else {
      return this
          .documentsWithPeople[this.clicked]
          .people
          .map((e) => 'images/' + e.image)
          .toList();
    }
  }
}
