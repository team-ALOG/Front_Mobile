import 'package:med/models/medecin.dart';

import '../models/user.dart';

class MedecinViewModel {
  Medecin _medecin;

  MedecinViewModel(Medecin medecin) : _medecin = medecin;

  String? get name {
    return _medecin.name;
  }
}
