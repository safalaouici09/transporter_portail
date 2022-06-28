import 'package:data_table_2/data_table_2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../constants/style.dart';
import '../../controllers/FormController.dart';
import '../../models/DemandeRem_model.dart';
import '../../widgets/Colored_Cntainer.dart';
import '../../widgets/costum_text.dart';

class MyWidget extends StatelessWidget {
  TextEditingController departController = TextEditingController();
  TextEditingController finController = TextEditingController();
  TextEditingController clientController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemandeController>(
        init: DemandeController(),
        builder: (controller) {
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
                    DataColumn2(
                        label: Text('type de véhicule'), size: ColumnSize.L),
                    DataColumn2(
                        label: Text('type de trajet'), size: ColumnSize.L),
                    DataColumn(
                      label: Text('N° de personnes'),
                    ),
                    DataColumn(label: Text('distance (km) ')),
                    DataColumn(
                      label: Text('état'),
                    ),
                  ],
                  rows: controller.demandes
                      .map(
                        (demande) => DataRow(
                            selected: controller.demandes.contains(demande),
                            cells: [
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
                            await showForm(
                                context, dateController, DateTime(2022));
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
        });
  }

  showForm(BuildContext context, TextEditingController dateController,
      DateTime dateTime) async {
    showDialog(
        context: context,
        builder: (context) {
          return GetBuilder<DemandeController>(
              init: DemandeController(),
              builder: (controller) {
                return StatefulBuilder(
                    // You need this, notice the parameters below:
                    builder: (context, setState) {
                  return AlertDialog(
                    scrollable: true,
                    actions: <Widget>[
                      GestureDetector(
                        onTap: () {
                          print("///////////////////////////");
                          print(controller.typeVec.value);
                          DemandeRemb demandeRemb = DemandeRemb(
                              departController.text,
                              finController.text,
                              "opérateur1",
                              clientController.text,
                              controller.typeVec.value,
                              dateController.text,
                              controller.distance.value,
                              controller.numPersonne.value,
                              controller.attente.value,
                              controller.typeTrajet.value,
                              "EN COURS ");

                          controller.addDemande(demandeRemb);
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
                                  getFormComponent("Lieu de Départ", "départ",
                                      departController),
                                  getFormComponent("Distination", "distenation",
                                      finController),
                                  getFormComponent("Client ", "Nom Prénom",
                                      clientController),
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
                                                        BorderRadius.circular(
                                                            15)),
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
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Icon(
                                              Icons.calendar_month_outlined,
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
                                  ], "Ambulance sanitaire", controller.typeVec,
                                      controller),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Nombre de personnes :",
                                    size: 16.0,
                                  ),
                                  getDropDownButton([1, 2, 3, 4, 5], 1,
                                      controller.numPersonne, controller),
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
                                    ], 5, controller.distance, controller),
                                  ]),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "attente :",
                                    size: 16.0,
                                  ),
                                  getDropDownButton(["OUI", "NON"], "OUI",
                                      controller.attente, controller),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "type de trajet  :",
                                    size: 16.0,
                                  ),
                                  getDropDownButton(
                                      ["Oraganisé", "Urgence"],
                                      "Oraganisé",
                                      controller.typeTrajet,
                                      controller),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Location  :",
                                    size: 16.0,
                                  ),
                                  getDropDownButton(["LOCATION"], "LOCATION",
                                      controller.location, controller),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                });
              });
        });
  }

  getDropDownButton(List items, var dropdownvalue, valueGetter,
      DemandeController controller) {
    return Builder(builder: (context) {
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
            dropdownvalue = newValue.toString();
            //todo: add setter

            controller.setValue(valueGetter, newValue);
          },
          value: dropdownvalue.toString(),
        ),
      );
    });
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
