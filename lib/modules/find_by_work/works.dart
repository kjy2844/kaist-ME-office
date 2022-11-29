import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class People {
  String name;
  String image;

  People(this.name, this.image);

  factory People.fromJson(Map<String, dynamic> json) {
    return People(json['name'], json['image']);
  }
}

class Work {
  String title;
  List<People> people;

  Work(this.title, this.people);

  factory Work.fromJson(Map<String, dynamic> json) {
    List<People> peopleList =
        json['people'].map<People>((json) => People.fromJson(json)).toList();
    return Work(json['title'], peopleList);
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

  List<String> getImagePaths() {
    if (this.clicked == -1) {
      return ['images/seat_before_example.png'];
    } else {
      return this
          .worksWithPeople[this.clicked]
          .people
          .map((e) => 'images/' + e.image)
          .toList();
    }
  }
}
