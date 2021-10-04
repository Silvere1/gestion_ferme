import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gestionferme/App/Provider/dataFile.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class BackupController extends GetxController {
  String? _path;
  var backupData = false.obs;
  Future<int?> createDir() async {
    final folderName = "GestionFerme/dataBase";
    Directory path;
    if (Platform.isWindows) {
      var _pt = await getDownloadsDirectory();
      String chemin;
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
        await Permission.storage.request().then((value) async {
          if (value.isGranted) {
            if (!await path.exists()) {
              await path.create();
            }
          } else {
            Get.defaultDialog(
              title: "Attention!",
              radius: 6,
              middleText:
                  "Autorisez l'application à accéder à votre stockage pour sauvegarder votre base de données.",
              cancel: Container(
                width: 100,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    createDir();
                    Get.back();
                  },
                  child: Text("Ok"),
                ),
              ),
            );
          }
        });
      } else {
        if (!await path.exists()) {
          await path.create();
        }
      }
    }
    if (await path.exists()) {
      _path = path.path;
      /* File file = File("$_path/ferme.db");
      if (await file.exists()) {
        backupData.value = true;
        DateTime dateTime = file.lastAccessedSync();
        print("${dateTime.toIso8601String()}");
      } else {
        backupData.value = false;
      }*/
      return 1;
    } else {
      return null;
    }
  }

  Future<void> saveDb() async {
    File file = dbFile;
    await file.copy("$_path/ferme.db").then((value) => print(value.path));
  }

  Future<void> restorDb() async {
    File file = File("$_path/ferme.db");
    await file.copy("${dbFile.path}").then((value) => print(value.path));
  }
}
