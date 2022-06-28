import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:transporter_portail/constants/style.dart';
import 'package:transporter_portail/widgets/costum_text.dart';
import 'package:transporter_portail/constants/controllers.dart';
import 'package:transporter_portail/helpers/reponsiveness.dart';
import 'package:transporter_portail/pages/clients/widgets/clients_table.dart';
import 'package:transporter_portail/widgets/costum_text.dart';
import 'package:get/get.dart';
import 'package:transporter_portail/models/clientModel.dart';

import '../../controllers/FormController.dart';
import '../../widgets/Colored_Cntainer.dart';

class ClientsPage extends StatelessWidget {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController datNaisController = TextEditingController();
  ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();

    TextEditingController dateController = TextEditingController(
      text: '${dateTime.day}/0${dateTime.month}/${dateTime.year}',
    );
    return GetBuilder<ClientController>(
        init: ClientController(),
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
                      label: Text("Nom"),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Prénom'),
                    ),
                    DataColumn(
                      label: Text('Date De naissance'),
                    ),
                    DataColumn(
                      label: Text('Numéro'),
                    ),
                    DataColumn(
                      label: Text('Adresse'),
                    ),
                    DataColumn(
                      label: Text('états'),
                    ),
                  ],
                  rows: controller.users
                      .map(
                        (user) => DataRow(
                            selected: controller.users.contains(user),
                            cells: [
                              DataCell(
                                Text(user.firstName.toString()),
                                onTap: () {
                                  // write your code..
                                },
                              ),
                              DataCell(
                                Text(user.lastName.toString()),
                                onTap: () {
                                  // write your code..
                                },
                              ),
                              DataCell(
                                Text(user.date_naissance.toString()),
                                onTap: () {
                                  // write your code..
                                },
                              ),
                              DataCell(
                                Text(user.numero.toString()),
                                onTap: () {
                                  // write your code..
                                },
                              ),
                              DataCell(
                                Text(user.adresse.toString()),
                                onTap: () {
                                  // write your code..
                                },
                              ),
                              DataCell(
                                Text("non confirmé"),
                                onTap: () {
                                  // write your code..
                                },
                              )
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
                          onTap: () async =>
                              await showForm(context, dateController, dateTime),
                          child: ColoredContainer(
                            text: "Ajouter Client",
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
    /* Column(
        children: [
          Obx(
            () => Row(
              children: [
                Expanded(
                  child: Container(
                      margin: EdgeInsets.only(
                          top:
                              ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                      child: CustomText(
                        text: menuController.activeItem.value,
                        size: 24,
                        weight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              shrinkWrap: true,
              children: [
                Clientstable(),
              ],
            ),
          ),
        ],
      ),*/
    /*);*/
  }

  showForm(BuildContext context, TextEditingController dateController,
      DateTime dateTime) async {
    showDialog(
        context: context,
        builder: (context) {
          return GetBuilder<ClientController>(
              init: ClientController(),
              builder: (controller) {
                return StatefulBuilder(
                    // You need this, notice the parameters below:
                    builder: (context, setState) {
                  return AlertDialog(
                      actions: <Widget>[
                        GestureDetector(
                          onTap: () {
                            print("///////////////////////////");
                            print(controller.firstName.value);
                            User user = User(
                                firstName: nomController.text,
                                lastName: prenomController.text,
                                numero: numeroController.text,
                                adresse: adressController.text,
                                operateur: "operateur1",
                                date_naissance: datNaisController.text);

                            controller.addClient(user);
                            Navigator.pop(context);
                          },
                          child: ColoredContainer(
                            text: "Confirmer",
                            color: active,
                          ),
                        ),
                      ],
                      scrollable: true,
                      title: Text('demandes de prise en charge du client  '),
                      content: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getFormComponent(
                                    "Nom d'assuré", "Nom", nomController),
                                getFormComponent("Prénom d'assuré", "Prénom",
                                    prenomController),
                                getFormComponent("Date de naissande jj/mm/aaaa",
                                    "jj/mm/aaaa", dateController),
                                getFormComponent("Adresse", "Wilaya--Commune",
                                    adressController),
                                getFormComponent("N° de téléphone",
                                    "N° de téléphone", nomController),
                              ],
                            ),
                          ),
                        ),
                      ));
                });
              });
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

  Widget getTextField(String? label) {
    return Row(
      children: [
        Flexible(
          child: Container(
            child: TextField(
              decoration: InputDecoration(
                  labelText: label,
                  border: OutlineInputBorder(
                      gapPadding: 1.0, borderRadius: BorderRadius.circular(15)),
                  labelStyle: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  )),
              //  controller: dateNaissController,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
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
}
