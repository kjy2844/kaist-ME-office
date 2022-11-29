class People {
  String name;
  String image;

  People(this.name, this.image);

  factory People.fromJson(Map<String, dynamic> json) {
    return People(json['name'], json['image']);
  }
}
