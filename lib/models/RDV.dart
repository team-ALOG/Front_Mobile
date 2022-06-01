class RDV {
  int? id;
  int? idPatient;
  String? nomMedecin;
  String? specialiteMedecin;
  String? date;

  RDV(this.idPatient, this.nomMedecin, this.date, this.specialiteMedecin);

  RDV.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomMedecin = json['idMedecin'];
    idPatient = json['idPatient'];
    date = json['date'];
  }
}
