import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:transporter_portail/constants/style.dart';
import 'package:transporter_portail/widgets/costum_text.dart';

/// Example without datasource
class Clientstable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: active.withOpacity(.4), width: .5),
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 6),
              color: lightGrey.withOpacity(.1),
              blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 30),
      child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 600,
          columns: [
            DataColumn2(
              label: Text("Date de depot"),
              size: ColumnSize.L,
            ),
            DataColumn(
              label: Text('operateur'),
            ),
            DataColumn(
              label: Text('client'),
            ),
            DataColumn(
              label: Text('Départ'),
            ),
            DataColumn(
              label: Text('arrivée'),
            ),
            DataColumn(label: Text('distance (km) ')),
            DataColumn(
              label: Text('date du trajet'),
            ),
            DataColumn(
              label: Text('type'),
            ),
            DataColumn(
              label: Text('type du trajet'),
            ),
            DataColumn(
              label: Text('vraie distance'),
            ),
            DataColumn(
              label: Text('état'),
            ),
            DataColumn(
              label: Text('Factures'),
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
                      text: "zaun",
                      size: 16,
                      color: Colors.black,
                      weight: FontWeight.normal,
                    )),
                    DataCell(CustomText(
                      text: "800.3",
                      size: 16,
                      color: Colors.black,
                      weight: FontWeight.normal,
                    )),
                    DataCell(CustomText(
                      text: "18/03/2021",
                      size: 16,
                      color: Colors.black,
                      weight: FontWeight.normal,
                    )),
                    DataCell(CustomText(
                      text: "léger",
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
                      text: "Jaximus",
                      size: 16,
                      color: Colors.black,
                      weight: FontWeight.normal,
                    )),
                    DataCell(Container(
                        decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: active, width: .5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: CustomText(
                          text: "download",
                          color: active.withOpacity(.7),
                          weight: FontWeight.bold,
                          size: 16,
                        ))),
                    DataCell(Container(
                        decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: active, width: .5),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: CustomText(
                          text: "download",
                          color: active.withOpacity(.7),
                          weight: FontWeight.bold,
                          size: 16,
                        ))),
                  ]))),
    );
  }
}
