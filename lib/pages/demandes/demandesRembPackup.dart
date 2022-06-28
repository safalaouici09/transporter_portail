import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:transporter_portail/constants/style.dart';
import 'package:transporter_portail/models/DemandeRem_model.dart';
import 'package:transporter_portail/widgets/costum_text.dart';

import '../../widgets/Colored_Cntainer.dart';

class DemandesPageee extends StatefulWidget {
  const DemandesPageee({Key? key}) : super(key: key);

  @override
  State<DemandesPageee> createState() => _DemandesPageeeState();
}

class _DemandesPageeeState extends State<DemandesPageee> {
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
                  label: Text("date du trajet"),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('type de véhicule'),
                ),
                DataColumn(
                  label: Text('N° de personnes'),
                ),
                DataColumn(label: Text('distance (km) ')),
                DataColumn(
                  label: Text('état'),
                ),
              ],
              rows: List<DataRow>.generate(
                  15,
                  (index) => DataRow(cells: [
                        DataCell(CustomText(
                          text: "21/02/2022",
                          size: 16,
                          color: Colors.black,
                          weight: FontWeight.normal,
                        )),
                        DataCell(CustomText(
                          text: "Jaximus",
                          size: 16,
                          color: Colors.black,
                          weight: FontWeight.normal,
                        )),
                        DataCell(CustomText(
                          text: "Xin zhao",
                          size: 16,
                          color: Colors.black,
                          weight: FontWeight.normal,
                        )),
                        DataCell(CustomText(
                          text: "ionia",
                          size: 16,
                          color: Colors.black,
                          weight: FontWeight.normal,
                        )),
                        DataCell(CustomText(
                          text: "ionia",
                          size: 16,
                          color: Colors.black,
                          weight: FontWeight.normal,
                        )),
                      ]))),
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
                              getDropDownButton(
                                  ["VCL", "VCE", "Ambilance"], "VCL"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Nombre de personnes :",
                                size: 16.0,
                              ),
                              getDropDownButton([1, 2, 3, 4, 5], 1),
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
                                ], 5),
                              ]),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "attente :",
                                size: 16.0,
                              ),
                              getDropDownButton(["OUI", "NON"], "OUI"),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Location  :",
                                size: 16.0,
                              ),
                              getDropDownButton(["LOCATION"], "LOCATION"),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: ColoredContainer(
                              text: "Confirmer",
                              color: active,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ));
          });
        });
  }

  Widget getDropDownButton(
    List items,
    var dropdownvalue,
  ) {
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
          });
        },
        value: dropdownvalue.toString(),
      ),
    );
  }
}
