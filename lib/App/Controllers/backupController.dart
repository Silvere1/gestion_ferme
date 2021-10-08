import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gestionferme/App/date.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sqflite/sqflite.dart';

class BackupController extends GetxController {
  String? _path;
  var backupData = false.obs;
  var lastSaveTime = "".obs;
  var isLoading1 = false.obs;
  var isLoading2 = false.obs;
  late File dbFile;

  void reset() {
    isLoading1.value = false;
    isLoading2.value = false;
    lastSaveTime.value = "";
  }

  Future<int?> createDir() async {
    dbFile = File(join(await getDatabasesPath(), "ferme.db"));
    final folderName = "GestionFerme/dataBase";
    final folderParent = "GestionFerme";
    Directory pathParent;
    Directory path;
    if (Platform.isWindows) {
      var _pt = await getDownloadsDirectory();
      String chemin = join(_pt!.path, folderName);
      String parent = join(_pt.path, folderParent);
      pathParent = Directory(parent);
      path = Directory(chemin);
      if (!await pathParent.exists()) {
        await pathParent.create();
      }
      if (!await path.exists()) {
        await path.create();
        print("Le dossier créé sur windows !!!");
      } else {
        print("Le dossier existe sur windows");
      }
    } else {
      pathParent = Directory("storage/emulated/0/$folderParent");
      path = Directory("storage/emulated/0/$folderName");
      var status = await Permission.storage.status;
      if (!status.isGranted) {
        await Permission.storage.request().then((value) async {
          if (value.isGranted) {
            if (!await pathParent.exists()) {
              await pathParent.create();
            }
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
        if (!await pathParent.exists()) {
          await pathParent.create();
        }
        if (!await path.exists()) {
          await path.create();
        }
      }
    }
    if (await path.exists()) {
      _path = path.path;
      File file = File("$_path/ferme.db");
      if (await file.exists()) {
        backupData.value = true;
        DateTime dateTime = file.lastModifiedSync();
        lastSaveTime.value = date.format(file.lastModifiedSync());
        lastSaveTime.value += " à ${dateTime.hour}h${dateTime.minute}";
        print("${dateTime.toIso8601String()}");
      } else {
        backupData.value = false;
      }
      return 1;
    } else {
      return null;
    }
  }

  Future<void> saveDb() async {
    //final file = dbFile;
    final file = File("$_path/ferme.db");
    var byteData = dbFile.readAsBytesSync();
    var bytes = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    file.writeAsBytes(bytes);
    await createDir();
  }

  Future<void> restorDb() async {
    final file = File("$_path/ferme.db");
    var byteData = file.readAsBytesSync();
    var bytes = byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    dbFile.writeAsBytes(bytes);
    /*await dbFile
        .writeAsBytes(file.readAsBytesSync(), mode: FileMode.append)
        .then((value) => print(value.path));*/
    //await file.copy("${dbFile.path}").then((value) => print(value.path));
  }
}
