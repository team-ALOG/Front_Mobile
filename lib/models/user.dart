class User {
  int? id;
  String? name;
  String? surname;
  String? email;
  String? address;

  User(this.name, this.surname, this.email);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nom'];
    surname = json['prenom'];
    email = json['email'];
    address = json['address'];
  }
}
