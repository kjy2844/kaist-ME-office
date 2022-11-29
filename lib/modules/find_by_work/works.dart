import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Work {
  String title;
  List<String> people;

  Work(this.title, this.people);

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(json['title'], List<String>.from(json['people']));
  }
}

class Works {
  List<Work> worksWithPeople = [];
  int clicked = -1;

  // getWorks from firestore
  // Future<List<Work>> getWorks() async {
  //   List<Work> newWorks = [];
  //   await FirebaseFirestore.instance
  //       .collection('works')
  //       .get()
  //       .then((QuerySnapshot querySnapshot) {
  //     querySnapshot.docs.forEach((doc) {
  //       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
  //       Work tmp = Work(data['title'], List<String>.from(data['people']));
  //       newWorks.add(tmp);
  //     });
  //   });
  //   this.worksWithPeople = newWorks;
  //   return this.worksWithPeople;
  // }

  Future<List<Work>> getWorks() async {
    final String response = await rootBundle.loadString('json/works_data.json');
    final data = json.decode(response).cast<Map<String, dynamic>>();

    this.worksWithPeople =
        data.map<Work>((json) => Work.fromJson(json)).toList();

    return this.worksWithPeople;
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
      if (this.worksWithPeople[this.clicked].people[0].compareTo('강성중') == 0) {
        return 'images/kang_seong_jung.png';
      } else {
        return 'images/seat_after_example.png';
      }
    }
  }
}
