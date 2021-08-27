import 'package:flutter/services.dart';
import 'package:gestionferme/App/Controllers/stockFicheController.dart';
import 'package:gestionferme/App/Models/ficheModel.dart';
import 'package:gestionferme/App/Provider/savePdf.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class PdfApiStock {
  static StockFicheController controller = Get.find();
  static var dateFormat = DateFormat.yMMMMd('fr');

  static Future<void> generatePdf(List<InfoStock> info) async {
    final _pdf = Document();
    final image = (await rootBundle.load("assets/icons/Logo GF (3).png"))
        .buffer
        .asUint8List();

    _pdf.addPage(
      MultiPage(
        pageFormat: PdfPageFormat(
          29.7 * PdfPageFormat.cm,
          21.0 * PdfPageFormat.cm,
          marginLeft: 1.0 * PdfPageFormat.cm,
          marginRight: 1.0 * PdfPageFormat.cm,
          marginTop: 1.2 * PdfPageFormat.cm,
          marginBottom: 1.2 * PdfPageFormat.cm,
        ),
        build: (_) => [
          buildTitle(image),
          buildHeadTble1(),
          buildTable1(info),
          SizedBox(height: 20),
          buildHeadTble2(),
          buildTable2(info),
          SizedBox(height: 20),
          buildHeadTble3(),
          buildTable3(info),
        ],
        header: (_) => buildHead(),
        footer: (_) => buildFoot(_, image),
      ),
    );

    await SavePdf.saveDoc(
        "Fiche du Stock ${dateFormat.format(DateTime.now())}.pdf", _pdf);
    /* Get.snackbar("Succès", "Fiche du stock est enregistrée avec succès.",
        duration: Duration(seconds: 5),
        colorText: Color(0xffffffff),
        backgroundColor: Color(0xff006A34).withOpacity(0.65));*/
  }

  static Widget buildHeadTble1() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 30,
              width: 220,
              child: Center(
                child: Text("Volailles"),
              ),
              decoration: BoxDecoration(
                color: PdfColors.green600,
              ),
            ),
          ),
          Container(
            height: 30,
            width: 225,
            child: Center(
              child: Text("Oeufs initial"),
            ),
            decoration: BoxDecoration(
              color: PdfColors.green400,
            ),
          ),
          Container(
            height: 30,
            width: 226,
            child: Center(
              child: Text("Oeufs produits"),
            ),
            decoration: BoxDecoration(
              color: PdfColors.green200,
            ),
          ),
        ],
      );
  static Widget buildHeadTble2() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 30,
              child: Center(
                child: Text("Oeufs vendus"),
              ),
              decoration: BoxDecoration(
                color: PdfColors.green400,
              ),
            ),
          ),
          Container(
            height: 30,
            width: 352,
            child: Center(
              child: Text("Oeufs mangés"),
            ),
            decoration: BoxDecoration(
              color: PdfColors.green200,
            ),
          ),
        ],
      );
  static Widget buildHeadTble3() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 30,
              child: Center(
                child: Text("Oeufs perdus"),
              ),
              decoration: BoxDecoration(
                color: PdfColors.green400,
              ),
            ),
          ),
          Container(
            height: 30,
            width: 315,
            child: Center(
              child: Text("Stock Oeufs final"),
            ),
            decoration: BoxDecoration(
              color: PdfColors.green200,
            ),
          ),
          Container(
            width: 82,
          ),
        ],
      );

  static Widget buildTable1(List<InfoStock> info) {
    final headers = [
      "Date/1",
      " Effect \n initial",
      "Morts",
      "Mangés",
      "Vendus",
      " Effect \n final",
      "Petits",
      "Moyens",
      "Grands",
      "  Total  ",
      "Petits",
      "Moyens",
      "Grands",
      "  Total  ",
    ];
    final data = info.map((e) {
      return [
        "${e.dateAt.day}/${e.dateAt.month}/${e.dateAt.year.toString().replaceRange(0, 2, "")}",
        "${e.stkInitial}",
        "${e.nbrMort}",
        "${e.nbrCons}",
        "${e.nbrVendu}",
        "${e.stkFinal}",
        "${e.iPoeuf}",
        "${e.iMoeuf}",
        "${e.iGoeuf}",
        "${e.iPoeuf + e.iMoeuf + e.iGoeuf}",
        "${e.cPoeuf}",
        "${e.cMoeuf}",
        "${e.cGoeuf}",
        "${e.cPoeuf + e.cMoeuf + e.cGoeuf}",
      ];
    }).toList();
    return Table.fromTextArray(
      headers: headers,
      headerStyle:
          TextStyle(fontWeight: FontWeight.bold, color: PdfColors.white),
      cellStyle: TextStyle(fontSize: 10),
      headerDecoration: BoxDecoration(
        color: PdfColor.fromHex("006A34"),
      ),
      data: data,
    );
  }

  static Widget buildTable2(List<InfoStock> info) {
    final headers = [
      "Date/2",
      "Petits",
      "Moyens",
      "Grands",
      "  Total  ",
      "Petits",
      "Moyens",
      "Grands",
      "  Total  ",
    ];
    final data = info.map((e) {
      return [
        "${e.dateAt.day}/${e.dateAt.month}/${e.dateAt.year.toString().replaceRange(0, 2, "")}",
        "${e.vPoeuf}",
        "${e.vMoeuf}",
        "${e.vGoeuf}",
        "${e.vPoeuf + e.vMoeuf + e.vGoeuf}",
        "${e.uPoeuf}",
        "${e.uMoeuf}",
        "${e.uGoeuf}",
        "${e.uPoeuf + e.uMoeuf + e.uGoeuf}",
      ];
    }).toList();
    return Table.fromTextArray(
      headers: headers,
      headerStyle:
          TextStyle(fontWeight: FontWeight.bold, color: PdfColors.white),
      cellStyle: TextStyle(fontSize: 10),
      headerDecoration: BoxDecoration(
        color: PdfColor.fromHex("006A34"),
      ),
      data: data,
    );
  }

  static Widget buildTable3(List<InfoStock> info) {
    final headers = [
      "Date/3",
      "Petits",
      "Moyens",
      "Grands",
      "  Total  ",
      "Petits",
      "Moyens",
      "Grands",
      "  Total  ",
      "Eclores",
    ];
    final data = info.map((e) {
      return [
        "${e.dateAt.day}/${e.dateAt.month}/${e.dateAt.year.toString().replaceRange(0, 2, "")}",
        "${e.pPoeuf}",
        "${e.pMoeuf}",
        "${e.pGoeuf}",
        "${e.pPoeuf + e.pMoeuf + e.pGoeuf}",
        "${e.sFinalPoeuf}",
        "${e.sFinalMoeuf}",
        "${e.sFinalGoeuf}",
        "${e.sFinalPoeuf + e.sFinalMoeuf + e.sFinalGoeuf}",
        "${e.oeufEclore}",
      ];
    }).toList();
    return Table.fromTextArray(
      headers: headers,
      headerStyle:
          TextStyle(fontWeight: FontWeight.bold, color: PdfColors.white),
      cellStyle: TextStyle(fontSize: 10),
      headerDecoration: BoxDecoration(
        color: PdfColor.fromHex("006A34"),
      ),
      data: data,
    );
  }

  static Widget buildTitle(var image) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Le ${dateFormat.format(DateTime.now())}"),
              Text("Fiche Stock",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  )),
              Image(MemoryImage(image), width: 55),
            ],
          ),
          SizedBox(height: 0.8 * PdfPageFormat.cm),
        ],
      );

  static Widget buildFoot(Context _, var image) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Image(MemoryImage(image), width: 26),
            Text("Généré par l'application mobile: GestionFerme",
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: PdfColors.grey)),
          ]),
          Text("page ${_.pageNumber} sur ${_.pagesCount}",
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: PdfColors.grey)),
        ],
      );
  static Widget buildHead() => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("Fiche de Stock",
              style: TextStyle(
                  fontStyle: FontStyle.italic, color: PdfColors.grey)),
        ],
      );
}
