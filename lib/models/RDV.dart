class RDV {
  int? id;
  int? idPatient;
  String? nomMedecin;
  String? emailMedecin;
  String? date;

  RDV(this.idPatient, this.nomMedecin, this.date, this.emailMedecin);

  RDV.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomMedecin = json['name'];
    emailMedecin = json['email'];
    date = json['date'];
  }
}
