class Medecin {
  int? id;
  String? name;
  String? surname;
  String? speciality;
  String? address;

  Medecin(this.name, this.surname, this.speciality);

  Medecin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    speciality = json['speciality'];
    address = json['address'];
  }
}
