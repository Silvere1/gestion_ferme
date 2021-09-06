import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestionferme/App/Controllers/stockFicheController.dart';
import 'package:gestionferme/App/Models/ficheModel.dart';
import 'package:gestionferme/App/Provider/stockPdfGenerat.dart';
import 'package:get/get.dart';

class VoirFicheStock extends StatefulWidget {
  const VoirFicheStock();

  @override
  _VoirFicheStockState createState() => _VoirFicheStockState();
}

class _VoirFicheStockState extends State<VoirFicheStock> {
  StockFicheController controller = Get.find();

  List<DataColumn> _createColumn() {
    return [
      DataColumn(label: Text("Date")),
      DataColumn(label: Text("Sujets\ninitial")),
      DataColumn(label: Text("morts")),
      DataColumn(label: Text("mangés")),
      DataColumn(label: Text("vendu")),
      DataColumn(label: Text("Effectif\nfinal")),
      DataColumn(label: Text("oeufs P\ninitial")),
      DataColumn(label: Text("oeufs M\ninitial")),
      DataColumn(label: Text("oeufs G\ninitial")),
      DataColumn(label: Text("Total oeufs\ninitial")),
      DataColumn(label: Text("oeufs P\nProduits")),
      DataColumn(label: Text("oeufs M\nProduits")),
      DataColumn(label: Text("oeufs G\nProduits")),
      DataColumn(label: Text("Total oeufs\nProduits")),
      DataColumn(label: Text("oeufs P\nSortis")),
      DataColumn(label: Text("oeufs M\nSortis")),
      DataColumn(label: Text("oeufs G\nSortis")),
      DataColumn(label: Text("Total oeufs\nSortis")),
      DataColumn(label: Text("oeufs P\nMangés")),
      DataColumn(label: Text("oeufs M\nMangés")),
      DataColumn(label: Text("oeufs G\nMangés")),
      DataColumn(label: Text("Total oeufs\nMangés")),
      DataColumn(label: Text("oeufs P\nPertes")),
      DataColumn(label: Text("oeufs M\nPertes")),
      DataColumn(label: Text("oeufs G\nPertes")),
      DataColumn(label: Text("Total oeufs\nPertes")),
      DataColumn(label: Text("oeufs P\nFinal")),
      DataColumn(label: Text("oeufs M\nFinal")),
      DataColumn(label: Text("oeufs G\nFinal")),
      DataColumn(label: Text("Total oeufs\nFinal")),
      DataColumn(label: Text("Sortis en\néclosion")),
    ];
  }

  DataRow _createRow(InfoStock e) {
    return DataRow(cells: [
      DataCell(Text("${e.dateAt.day}/${e.dateAt.month}/${e.dateAt.year}")),
      DataCell(Text("${e.stkInitial}")),
      DataCell(Text("${e.nbrMort}")),
      DataCell(Text("${e.nbrCons}")),
      DataCell(Text("${e.nbrVendu}")),
      DataCell(Text("${e.stkFinal}")),
      DataCell(Text("${e.iPoeuf}")),
      DataCell(Text("${e.iMoeuf}")),
      DataCell(Text("${e.iGoeuf}")),
      DataCell(Text("${e.iPoeuf + e.iMoeuf + e.iGoeuf}")),
      DataCell(Text("${e.cPoeuf}")),
      DataCell(Text("${e.cMoeuf}")),
      DataCell(Text("${e.cGoeuf}")),
      DataCell(Text("${e.cPoeuf + e.cMoeuf + e.cGoeuf}")),
      DataCell(Text("${e.vPoeuf}")),
      DataCell(Text("${e.vMoeuf}")),
      DataCell(Text("${e.vGoeuf}")),
      DataCell(Text("${e.vPoeuf + e.vMoeuf + e.vGoeuf}")),
      DataCell(Text("${e.uPoeuf}")),
      DataCell(Text("${e.uMoeuf}")),
      DataCell(Text("${e.uGoeuf}")),
      DataCell(Text("${e.uPoeuf + e.uMoeuf + e.uGoeuf}")),
      DataCell(Text("${e.pPoeuf}")),
      DataCell(Text("${e.pMoeuf}")),
      DataCell(Text("${e.pGoeuf}")),
      DataCell(Text("${e.pPoeuf + e.pMoeuf + e.pGoeuf}")),
      DataCell(Text("${e.sFinalPoeuf}")),
      DataCell(Text("${e.sFinalMoeuf}")),
      DataCell(Text("${e.sFinalGoeuf}")),
      DataCell(Text("${e.sFinalPoeuf + e.sFinalMoeuf + e.sFinalGoeuf}")),
      DataCell(Text("${e.oeufEclore}")),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Fiche de Stock"),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: FutureBuilder(
            future: controller.collecteInfoStock(),
            builder: (_, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
              }
              if (snapshot.hasData) {
                return Scaffold(
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
                                    fontWeight: FontWeight.w600, fontSize: 16),
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
                              rows: controller.listInfoStock
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
                                await PdfApiStock.generatePdf(
                                    controller.listInfoStock);
                                await controller.setLoading(false);
                              },
                        child: controller.isLoading.value
                            ? CircularProgressIndicator()
                            : SvgPicture.asset("assets/icons/export_pdf.svg"),
                        backgroundColor: Colors.white,
                      )),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
