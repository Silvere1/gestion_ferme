import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestionferme/App/Controllers/proFicheController.dart';
import 'package:gestionferme/App/Models/ficheModel.dart';
import 'package:gestionferme/App/Provider/proPdfGenerat.dart';
import 'package:get/get.dart';

class VoirFichePro extends StatefulWidget {
  const VoirFichePro({Key? key}) : super(key: key);

  @override
  _VoirFicheProState createState() => _VoirFicheProState();
}

class _VoirFicheProState extends State<VoirFichePro> {
  ProFicheController controller = Get.find();

  List<DataColumn> _createColumn() {
    return [
      DataColumn(label: Text("Date")),
      DataColumn(label: Text("Provendes")),
      DataColumn(label: Text("Stock\ninitial")),
      DataColumn(label: Text("Appro")),
      DataColumn(label: Text("Consommé")),
      DataColumn(label: Text("Stock\nfinal")),
      DataColumn(label: Text("Produits\ntraitement")),
      DataColumn(label: Text("Stock\ninitial")),
      DataColumn(label: Text("Appro")),
      DataColumn(label: Text("Consommé")),
      DataColumn(label: Text("Stock\nfinal")),
    ];
  }

  DataRow _createRow(InfoPro e) {
    return DataRow(cells: [
      DataCell(Text("${e.dateAt.day}/${e.dateAt.month}/${e.dateAt.year}")),
      DataCell(
        e.prov.length != 0
            ? Container(
                width: 110,
                constraints: BoxConstraints(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: e.prov.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${e.prov[i].nom}",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              )
            : Text("aucun"),
      ),
      DataCell(
        e.prov.length != 0
            ? Container(
                width: 100,
                constraints: BoxConstraints(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: e.prov.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${e.prov[i].iniQte} ${e.prov[i].unite}",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              )
            : Text("aucun"),
      ),
      DataCell(
        e.prov.length != 0
            ? Container(
                width: 100,
                constraints: BoxConstraints(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: e.prov.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${e.prov[i].approQte} ${e.prov[i].unite}",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              )
            : Text("aucun"),
      ),
      DataCell(
        e.prov.length != 0
            ? Container(
                width: 100,
                constraints: BoxConstraints(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: e.prov.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${e.prov[i].consQte} ${e.prov[i].unite}",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              )
            : Text("aucun"),
      ),
      DataCell(
        e.prov.length != 0
            ? Container(
                width: 100,
                constraints: BoxConstraints(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: e.prov.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${e.prov[i].finQte} ${e.prov[i].unite}",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              )
            : Text("aucun"),
      ),
      DataCell(
        e.prod.length != 0
            ? Container(
                width: 110,
                constraints: BoxConstraints(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: e.prod.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${e.prod[i].nom}",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              )
            : Text("aucun"),
      ),
      DataCell(
        e.prod.length != 0
            ? Container(
                width: 100,
                constraints: BoxConstraints(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: e.prod.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${e.prod[i].iniQte} ${e.prod[i].unite}",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              )
            : Text("aucun"),
      ),
      DataCell(
        e.prod.length != 0
            ? Container(
                width: 100,
                constraints: BoxConstraints(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: e.prod.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${e.prod[i].approQte} ${e.prod[i].unite}",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              )
            : Text("aucun"),
      ),
      DataCell(
        e.prod.length != 0
            ? Container(
                width: 100,
                constraints: BoxConstraints(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: e.prod.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${e.prod[i].consQte} ${e.prod[i].unite}",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              )
            : Text("aucun"),
      ),
      DataCell(
        e.prod.length != 0
            ? Container(
                width: 100,
                constraints: BoxConstraints(),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: e.prod.length,
                  itemBuilder: (_, i) => Row(
                    children: [
                      Expanded(
                          child: Text(
                        "${e.prod[i].finQte} ${e.prod[i].unite}",
                        overflow: TextOverflow.ellipsis,
                      )),
                    ],
                  ),
                ),
              )
            : Text("aucun"),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fiche Provendes/Produits"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: FutureBuilder(
            future: controller.collectInfo(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              return snapshot.hasData
                  ? Scaffold(
                      body: SingleChildScrollView(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                              child: Column(
                                children: [
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
                                  rows: controller.listInfoPro
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
                                    await ProPdfApi.generatePdf(
                                        controller.listInfoPro);
                                    await controller.setLoading(false);
                                  },
                            child: controller.isLoading.value
                                ? CircularProgressIndicator()
                                : SvgPicture.asset(
                                    "assets/icons/export_pdf.svg"),
                            backgroundColor: Colors.white,
                          )),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            }),
      ),
    );
  }
}
