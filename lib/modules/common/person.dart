class Person {
  String name;
  String image;

  Person(this.name, this.image);

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(json['name'], json['image']);
  }
}
