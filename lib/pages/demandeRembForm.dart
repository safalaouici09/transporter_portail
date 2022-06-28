import 'package:flutter/material.dart';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:transporter_portail/constants/style.dart';
import 'package:transporter_portail/models/DemandeRem_model.dart';
import 'package:transporter_portail/widgets/Colored_Cntainer.dart';
import 'package:transporter_portail/widgets/costum_text.dart';

class DemandeForm extends StatefulWidget {
  DemandeForm({Key? key}) : super(key: key);

  @override
  State<DemandeForm> createState() => _DemandeFormState();
}

class _DemandeFormState extends State<DemandeForm> {
  @override
  Widget build(BuildContext context) {
    // Initial Selected Value

    DateTime dateTime = DateTime.now();

    TextEditingController dateController = TextEditingController(
      text: '${dateTime.day}/0${dateTime.month}/${dateTime.year}',
    );

    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(15),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "La date de l'opération :",
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
                                    borderRadius: BorderRadius.circular(15)),
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
                          final DateTime? picked = await showDatePicker(
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
                  getDropDownButton(["VCL", "VCE", "Ambilance"], "VCL"),
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    text: "Location  :",
                    size: 16.0,
                  ),
                  getDropDownButton(["LOCATION"], "LOCATION"),
                ],
              ),
              GestureDetector(
                child: ColoredContainer(
                  text: "Confirmer",
                  color: active,
                ),
              )
            ],
          ),
        ),
      ),
    )
        /* Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            DropdownButton(
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.normal),
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue;
                  print(dropdownValue);
                  setState(() {});
                });
              },
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
            )
          ],
        ),
      ),*/
        );
  }

  Widget getDropDownButton(List items, var dropdownvalue) {
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
