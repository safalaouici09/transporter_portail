import 'package:get/get.dart';
import 'package:transporter_portail/models/DemandeRem_model.dart';

import '../models/clientModel.dart';

class DemandeController extends GetxController {
  List<DemandeRemb> get demandes => _demandes;
  List<DemandeRemb> _demandes = <DemandeRemb>[
    DemandeRemb(
        "Bab zouar",
        "Alger Centre",
        "operateur1",
        "nom prénon ",
        "Ambulance sanitaire",
        "13/06/2022",
        "80.5",
        "4",
        "OUI",
        "Organisé",
        "en cours"),
  ];
  // It is mandatory initialize with one value from listType
  var depart = "".obs,
      fin = "".obs,
      typeTrajet = "".obs,
      typeVec = "".obs,
      distance = "".obs,
      numPersonne = "".obs,
      attente = "".obs,
      location = "".obs,
      etatl = "".obs;

  void setValue(var attribute, var value) {
    attribute.value = value;
  }

  void addDemande(DemandeRemb demandeRemb) {
    _demandes.add(demandeRemb);
    update();
  }
}

class ClientController extends GetxController {
  List<User> get users => _users;
  List<User> _users = <User>[
    User(
        firstName: 'Emma',
        lastName: 'Field',
        date_naissance: "01/01/2000",
        numero: "0789562310",
        adresse: 'azazga',
        operateur: 'boualem'),
    User(
        firstName: 'Max',
        lastName: 'Stone',
        date_naissance: "01/01/2000",
        numero: "0789562310",
        adresse: 'azazga',
        operateur: 'boualem'),
    User(
        firstName: 'Sarah',
        lastName: 'Winter',
        date_naissance: "01/01/2000",
        numero: "0789562310",
        adresse: 'azazga',
        operateur: 'boualem'),
    User(
        firstName: 'James',
        lastName: 'Summer',
        date_naissance: "01/01/2000",
        numero: "0789562310",
        adresse: 'azazga',
        operateur: 'boualem'),
    User(
        firstName: 'Lorita',
        lastName: 'Wilcher',
        date_naissance: "01/01/2000",
        numero: "0789562310",
        adresse: 'azazga',
        operateur: 'boualem'),
  ];
  // It is mandatory initialize with one value from listType
  var firstName = "".obs,
      lastName = "".obs,
      date_naissance = "".obs,
      numero = "".obs,
      adresse = "".obs,
      operateur = "".obs;
  void setValue(var attribute, var value) {
    attribute.value = value;
  }

  void addClient(User user) {
    _users.add(user);
    update();
  }
}
