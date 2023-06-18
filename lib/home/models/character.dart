class Character {
  int id;
  String name;
  String image;
  String status;
  String species;

  // Character(
  //     {required this.id,
  //     required this.name,
  //     required this.image,
  //     required this.status,
  //     required this.species});

  Character.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['image'],
        species = json['species'],
        status = json['status'];
}
