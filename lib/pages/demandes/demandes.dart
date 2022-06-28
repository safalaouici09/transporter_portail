import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:get/get.dart';

import 'package:transporter_portail/constants/style.dart';
import 'package:transporter_portail/models/DemandeRem_model.dart';
import 'package:transporter_portail/widgets/costum_text.dart';

import '../../widgets/Colored_Cntainer.dart';

class DemandesPage extends StatefulWidget {
  DemandesPage({Key? key}) : super(key: key);

  @override
  State<DemandesPage> createState() => _DemandesPageState();
}

class _DemandesPageState extends State<DemandesPage> {
  var depart = "".obs(),
      fin = "".obs(),
      typeTrajet = "".obs(),
      typeVec = "".obs(),
      distance = 0.0.obs(),
      numPersonne = 0.obs(),
      attente = "".obs(),
      location = "".obs(),
      etatl = "".obs();
  TextEditingController departController = TextEditingController();
  TextEditingController finController = TextEditingController();
  TextEditingController clientController = TextEditingController();

  List<DemandeRemb> demandes = <DemandeRemb>[
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
    /*  DemandeRemb(
        "Alger Centre",
        "Belida",
        "operateur1",
        "nom prénon ",
        "Véhicule sanitaire léger",
        "14/06/2022",
        80.5,
        4,
        "OUI",
        "Organisé",
        "en cours"),
    DemandeRemb(
        "Oued Smar",
        "Zeralda",
        "operateur1",
        "nom prénon ",
        "Véhicule sanitaire léger",
        "16/06/2022",
        100,
        4,
        "NON",
        "Organisé",
        "en cours"),
    DemandeRemb(
        "Alger",
        "Ain Naadja",
        "operateur1",
        "nom prénon ",
        "Ambulance sanitaire",
        "09/06/2022",
        30,
        4,
        "OUI",
        "Organisé",
        "en cours"),
    DemandeRemb("Bab zouar", "Ain Naadja", "operateur1", "nom prénon ",
        "Ambilance", "02/06/2022", 45, 4, "NON", "urgence", "accepté"),
    DemandeRemb(
        "Bab zouar",
        "Oued Smar",
        "operateur1",
        "nom prénon ",
        "Ambulance sanitaire",
        "03/06/2022",
        20,
        4,
        "NON",
        "Organisé",
        "accepté"),*/
  ];
  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();

    TextEditingController dateController = TextEditingController(
      text: '${dateTime.day}/0${dateTime.month}/${dateTime.year}',
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            minWidth: 600,
            columns: [
              DataColumn2(
                label: Text("départ"),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text("destination"),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text("date du trajet"),
                size: ColumnSize.L,
              ),
              DataColumn2(
                label: Text("client"),
                size: ColumnSize.L,
              ),
              DataColumn2(label: Text('type de véhicule'), size: ColumnSize.L),
              DataColumn2(label: Text('type de trajet'), size: ColumnSize.L),
              DataColumn(
                label: Text('N° de personnes'),
              ),
              DataColumn(label: Text('distance (km) ')),
              DataColumn(
                label: Text('état'),
              ),
            ],
            rows: demandes
                .map(
                  (demande) =>
                      DataRow(selected: demandes.contains(demande), cells: [
                    DataCell(
                      Text(demande.depart.toString()),
                      onTap: () {
                        // write your code..
                      },
                    ),
                    DataCell(
                      Text(demande.fin.toString()),
                      onTap: () {
                        // write your code..
                      },
                    ),
                    DataCell(
                      Text(demande.dateTrajet.toString()),
                      onTap: () {
                        // write your code..
                      },
                    ),
                    DataCell(
                      Text(demande.client.toString()),
                    ),
                    DataCell(
                      Text(demande.typeVec.toString()),
                    ),
                    DataCell(
                      Text(demande.typeTrajet.toString()),
                    ),
                    DataCell(
                      Text(demande.numPersonnes.toString()),
                    ),
                    DataCell(
                      Text(demande.distance.toString()),
                    ),
                    DataCell(
                      Text(demande.etat.toString()),
                    ),
                  ]),
                )
                .toList(),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await showForm(context, dateController, dateTime);
                    },
                    child: ColoredContainer(
                      text: "Demander remboursement",
                      color: active,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }

  showForm(BuildContext context, TextEditingController dateController,
      DateTime dateTime) async {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(// You need this, notice the parameters below:
              builder: (context, setState) {
            return AlertDialog(
                scrollable: true,
                actions: <Widget>[
                  GestureDetector(
                    onTap: () {
                      print("///////////////////////////");
                      print(typeVec);
                      DemandeRemb demenadeRemb = DemandeRemb(
                          departController.text,
                          finController.text,
                          "opérateur1",
                          clientController.text,
                          typeVec,
                          dateController.text,
                          distance.toString(),
                          numPersonne.toString(),
                          attente,
                          typeTrajet,
                          "EN COURS ");

                      demandes.add(demenadeRemb);
                      Navigator.pop(context);
                    },
                    child: ColoredContainer(
                      text: "Confirmer",
                      color: active,
                    ),
                  )
                ],
                title: Text('demandes de remboursement '),
                content: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              getFormComponent(
                                  "Lieu de Départ", "départ", departController),
                              getFormComponent(
                                  "Distination", "distenation", finController),
                              getFormComponent(
                                  "Client ", "Nom Prénom", clientController),
                              CustomText(
                                text: "La date de l'opération : jj/mm/aa",
                                size: 16.0,
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      margin: EdgeInsets.all(20),
                                      child: TextField(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                                gapPadding: 1.0,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            labelStyle: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 18,
                                            )),
                                        controller: dateController,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () async* {
                                      final DateTime? picked =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: dateTime,
                                              firstDate: DateTime(2015, 8),
                                              lastDate: DateTime(2101));
                                      if (picked != null)
                                        setState(() {
                                          dateTime = picked;

                                          dateController.text =
                                              '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                                        });
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10),
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: active,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Icon(Icons.calendar_month_outlined,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Type de véhicule :",
                                size: 16.0,
                              ),
                              getDropDownButton([
                                "Ambulance médicalisée",
                                "Ambulance sanitaire",
                                "Véhicule sanitaire léger"
                              ], "Ambulance sanitaire", typeVec),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Nombre de personnes :",
                                size: 16.0,
                              ),
                              getDropDownButton(
                                  [1, 2, 3, 4, 5], 1, numPersonne),
                            ],
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "Nombre de Kilométres parcourus :",
                                  size: 16.0,
                                ),
                                getDropDownButton([
                                  5,
                                  10,
                                  15,
                                  20,
                                  25,
                                  30,
                                  40,
                                  50,
                                  60,
                                  70,
                                  80,
                                  90,
                                  100,
                                  120,
                                  140,
                                  160,
                                  180,
                                  200
                                ], 5, distance),
                              ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "attente :",
                                size: 16.0,
                              ),
                              getDropDownButton(["OUI", "NON"], "OUI", attente),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "type de trajet  :",
                                size: 16.0,
                              ),
                              getDropDownButton(["Oraganisé", "Urgence"],
                                  "Oraganisé", typeTrajet),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Location  :",
                                size: 16.0,
                              ),
                              getDropDownButton(
                                  ["LOCATION"], "LOCATION", location),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ));
          });
        });
  }

  getDropDownButton(List items, var dropdownvalue, valueGetter) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.all(15),
      child: DropdownButtonFormField2(
        // Initial Value
        decoration: InputDecoration(
            border: OutlineInputBorder(
                gapPadding: 1.0, borderRadius: BorderRadius.circular(15)),
            labelStyle: TextStyle(
              color: Colors.black54,
              fontSize: 18,
            )),
        // Down Arrow Icon
        icon: const Icon(Icons.keyboard_arrow_down),

        // Array list of items
        items: items.map((items) {
          return DropdownMenuItem(
            value: items.toString(),
            child: Text(items.toString()),
          );
        }).toList(),
        // After selecting the desired option,it will
        // change button value to selected value
        onChanged: (newValue) {
          setState(() {
            dropdownvalue = newValue.toString();
            valueGetter = newValue;
          });
        },
        value: dropdownvalue.toString(),
      ),
    );
  }

  Column getFormComponent(
      String text, String label, TextEditingController textEditingController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: text,
          size: 16.0,
        ),
        Row(
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      labelText: label,
                      border: OutlineInputBorder(
                          gapPadding: 1.0,
                          borderRadius: BorderRadius.circular(15)),
                      labelStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                      )),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
