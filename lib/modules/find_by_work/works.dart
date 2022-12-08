import 'dart:convert';
import 'package:me_office/modules/common/person.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../common/language.dart';

class Work {
  String title_kor;
  String title_eng;
  List<Person> people;

  Work(this.title_kor, this.title_eng, this.people);

  factory Work.fromJson(Map<String, dynamic> json) {
    List<Person> peopleList =
        json['people'].map<Person>((json) => Person.fromJson(json)).toList();
    return Work(json['title_kor'], json['title_eng'], peopleList);
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
    final String response =
        await rootBundle.loadString('assets/json/works_data.json');
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

  List<String> getImagePaths() {
    if (this.clicked == -1) {
      return ['assets/images/seat_before_example.png'];
    } else {
      return this
          .worksWithPeople[this.clicked]
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
      return this.worksWithPeople[index].title_kor;
    } else if (Language.getCurLang() == LanguageType.Eng) {
      return this.worksWithPeople[index].title_eng;
    } else {
      return "";
    }
  }
}
