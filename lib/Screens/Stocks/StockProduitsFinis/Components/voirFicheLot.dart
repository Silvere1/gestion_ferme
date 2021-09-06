import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestionferme/App/Controllers/ficheController.dart';
import 'package:gestionferme/App/Models/ficheModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Provider/pdfFileGenerat.dart';
import 'package:get/get.dart';

import '/App/date.dart';
import 'archiveAlertDialog.dart';

class VoirFicheLot extends StatefulWidget {
  const VoirFicheLot(this.lot);
  final Lot lot;

  @override
  _VoirFicheLotState createState() => _VoirFicheLotState(lot);
}

class _VoirFicheLotState extends State<VoirFicheLot>
    with TickerProviderStateMixin {
  FicheController controller = Get.find();
  final Lot lot;

  late ScrollController scrollController;
  bool dialVisible = true;

  _VoirFicheLotState(this.lot);

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  SpeedDial buildFloatingButton() {
    return SpeedDial(
      icon: Icons.menu,
      activeIcon: Icons.close,
      visible: dialVisible,
      children: [
        SpeedDialChild(
          child: Icon(Icons.delete),
          backgroundColor: Colors.red,
          label: 'Archiver',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () async {
            /*await SavePdf.saveDoc("name");*/
            showDialog(
                context: context,
                builder: (_) {
                  return ArchiveAlertDialog(lot);
                });
          },
        ),
        SpeedDialChild(
          child: Icon(Icons.book),
          backgroundColor: Colors.blue,
          label: 'Pdf',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () async {
            await PdfApi.generatePdf(controller.listInfoDayVol);
          },
        ),
      ],
    );
  }

  List<DataColumn> _createColumn() {
    return [
      DataColumn(label: Text("Date")),
      DataColumn(label: Text("Nbre\njours")),
      DataColumn(label: Text("Effectif\ndépart")),
      DataColumn(label: Text("mort")),
      DataColumn(label: Text("vendu")),
      DataColumn(label: Text("manger")),
      DataColumn(label: Text("Effectif\nfinal")),
      DataColumn(label: Text("1er service")),
      DataColumn(label: Text("2ème service")),
      DataColumn(label: Text("3ème service")),
      DataColumn(label: Text("Total services")),
      DataColumn(label: Text("Qté Eau")),
      DataColumn(label: Text("Petits\noeufs")),
      DataColumn(label: Text("Moyens\noeufs")),
      DataColumn(label: Text("Grands\noeufs")),
      DataColumn(label: Text("Fêlés\noeufs")),
      DataColumn(label: Text("Total\noeufs")),
      DataColumn(label: Text("Traitements")),
      DataColumn(label: Text("Total\ntraitements")),
      DataColumn(label: Text("Taux\nponte")),
    ];
  }

  DataRow _createRow(InfoDayVol info) {
    return DataRow(cells: [
      DataCell(
          Text("${info.dateAt.day}/${info.dateAt.month}/${info.dateAt.year}")),
      DataCell(Text("${info.dayOfWeek}")),
      DataCell(Text("${info.effDepart}")),
      DataCell(Text("${info.nbrMort}")),
      DataCell(Text("${info.nbrVendu}")),
      DataCell(Text("${info.nbrCons}")),
      DataCell(Text("${info.effFinal}")),
      DataCell(
        Container(
          width: 100,
          child: info.service1.length != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.service1.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${info.service1[i].provende.nom}",
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Text("${info.service1[i].qte} "),
                      Text("${info.service1[i].provende.unite}"),
                    ],
                  ),
                )
              : Text("aucun"),
        ),
        placeholder: true,
      ),
      DataCell(
        Container(
          width: 100,
          child: info.service2.length != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.service2.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${info.service2[i].provende.nom}",
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Text("${info.service2[i].qte} "),
                      Text("${info.service2[i].provende.unite}"),
                    ],
                  ),
                )
              : Text("aucun"),
        ),
        placeholder: true,
      ),
      DataCell(
        Container(
          width: 100,
          child: info.service3.length != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.service3.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${info.service3[i].provende.nom}",
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Text("${info.service3[i].qte} "),
                      Text("${info.service3[i].provende.unite}"),
                    ],
                  ),
                )
              : Text("aucun"),
        ),
        placeholder: true,
      ),
      DataCell(
        Container(
          width: 100,
          child: info.totalServices.length != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.totalServices.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${info.totalServices[i].nom}",
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Text("${info.totalServices[i].total} "),
                      Text("${info.totalServices[i].unite}"),
                    ],
                  ),
                )
              : Text("0"),
        ),
        placeholder: true,
      ),
      DataCell(Text("${info.qteEau} l")),
      DataCell(Text("${info.cP}")),
      DataCell(Text("${info.cM}")),
      DataCell(Text("${info.cG}")),
      DataCell(Text("${info.cF}")),
      DataCell(Text("${info.cT}")),
      DataCell(
        Container(
          width: 100,
          child: info.traitement.length != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.traitement.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${info.traitement[i].produit.nom}",
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Text("${info.traitement[i].qte} "),
                      Text("${info.traitement[i].produit.unite}"),
                    ],
                  ),
                )
              : Text("aucun"),
        ),
        placeholder: true,
      ),
      DataCell(
        Container(
          width: 100,
          child: info.totalTraitement.length != 0
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: info.totalTraitement.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${info.totalTraitement[i].nom}",
                        overflow: TextOverflow.ellipsis,
                      )),
                      SizedBox(
                        width: 8,
                      ),
                      Text("${info.totalTraitement[i].total} "),
                      Text("${info.totalTraitement[i].unite}"),
                    ],
                  ),
                )
              : Text("0"),
        ),
        placeholder: true,
      ),
      DataCell(Text("${info.tauxPonte.toPrecision(2)}")),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Suivi journalier du lot N° : ${lot.num}"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: FutureBuilder(
            future: controller.collecteInfo(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? Scaffold(
                      body: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 46),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.ageType.value == 1
                                      ? "${lot.nmbrVolauillles} poussin(s)"
                                      : controller.ageType.value == 2
                                          ? "${lot.nmbrVolauillles} poulette(s)"
                                          : "${lot.nmbrVolauillles} pondeuse(s)"),
                                  Text(
                                      "${lot.age + DateTime.now().difOnlyDay(lot.createAt)} jour(s)"),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Tableau des données",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: DataTable(
                                  columnSpacing: 30,
                                  showBottomBorder: true,
                                  decoration: BoxDecoration(
                                      border: Border(
                                    top: BorderSide(
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      width: 1,
                                    ),
                                    left: BorderSide(
                                      width: 1,
                                    ),
                                    right: BorderSide(
                                      width: 1,
                                    ),
                                  )),
                                  columns: _createColumn(),
                                  rows: controller.listInfoDayVol
                                      .map((e) => _createRow(e))
                                      .toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      floatingActionButton: Obx(() => FloatingActionButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : () async {
                                    await controller.setLoading(true);
                                    await PdfApi.generatePdf(
                                        controller.listInfoDayVol);
                                    await controller.setLoading(false);
                                  },
                            child: controller.isLoading.value
                                ? CircularProgressIndicator()
                                : SvgPicture.asset(
                                    "assets/icons/export_pdf.svg"),
                            backgroundColor: Colors.white,
                          )),
                    )
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
