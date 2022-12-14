import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:permission_handler/permission_handler.dart';

class SavePdf {
  static Future<void> saveDoc(String name, pd.Document document) async {
    final folderName = "GestionFerme";
    Directory path;
    if (Platform.isWindows) {
      var _pt = await getDownloadsDirectory();
      String chemin; /* = "${_pt!.path.replaceAll("'", "")}\\GestionFerme";*/
      chemin = join(_pt!.path, folderName);
      path = Directory(chemin);
      if (!await path.exists()) {
        await path.create();
        print("Le dossier créé sur windows !!!");
      } else {
        print("Le dossier existe sur windows");
      }
    } else {
      path = Directory("storage/emulated/0/$folderName");
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request();
      } else {
        if (!await path.exists()) {
          await path.create();
        }
      }
    }

    final bytes = await document.save();
    final file = File("${path.path}/$name");
    if (await path.exists()) {
      await file.writeAsBytes(bytes);
      _nackbar().then((value) async => await OpenFile.open(file.path));
    } else {
      path = Directory("storage/emulated/0/$folderName");
      await Permission.storage.request();
      var status = await Permission.storage.status;
      if (status.isGranted) {
        await path.create();
        await file.writeAsBytes(bytes);
        _nackbar().then((value) async => await OpenFile.open(file.path));
      }
    }
  }

  static _nackbar() async {
    return await Get.snackbar("Succès", "Le fiche est enregistrée avec succès.",
        duration: Duration(seconds: 5),
        colorText: Color(0xffffffff),
        backgroundColor: Color(0xff006A34).withOpacity(0.65));
  }
}
