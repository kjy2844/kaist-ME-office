import 'dart:convert';

import 'package:flutter/services.dart';

class Document {
  String title;
  List<String> people;

  Document(this.title, this.people);

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(json['title'], List<String>.from(json['people']));
  }
}

class Documents {
  List<Document> documentsWithPeople = [];

  int clicked = -1;

  Future<List<Document>> getDocuments() async {
    final String response =
        await rootBundle.loadString('json/documents_data.json');
    final data = json.decode(response).cast<Map<String, dynamic>>();

    documentsWithPeople =
        data.map<Document>((json) => Document.fromJson(json)).toList();
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
