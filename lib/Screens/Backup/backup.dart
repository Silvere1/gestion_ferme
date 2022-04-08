import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gestionferme/App/Controllers/backupController.dart';
import 'package:get/get.dart';

class BackupDb extends StatefulWidget {
  const BackupDb({Key? key}) : super(key: key);

  @override
  _BackupDbState createState() => _BackupDbState();
}

class _BackupDbState extends State<BackupDb> {
  BackupController controller = Get.find();
  late Future<int?> _build;

  @override
  void initState() {
    super.initState();
    controller.reset();
    _build = controller.createDir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sauvegarde"),
        elevation: 0.5,
        centerTitle: true,
      ),
      body: SafeArea(
          child: FutureBuilder(
              future: _build,
              builder: (_, snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                }
                return snapshot.hasData
                    ? snapshot.data != null
                        ? Center(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(
                                    () => controller.lastSaveTime.value != ""
                                        ? Column(
                                            children: [
                                              Wrap(
                                                children: [
                                                  Text(
                                                      "Dernière sauvegarde : "),
                                                  Text(
                                                      "${controller.lastSaveTime}",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Container(
                                                height: Get.height / 4,
                                                child: SvgPicture.asset(
                                                    "assets/icons/undraw_export_files_re_99ar.svg"),
                                              ),
                                            ],
                                          )
                                        : Column(
                                            children: [
                                              Container(
                                                height: Get.height / 3.5,
                                                child: SvgPicture.asset(
                                                    "assets/icons/undraw_export_files_re_99ar.svg"),
                                              ),
                                              Text(
                                                "Exporter votre base de données",
                                                style: TextStyle(
                                                    color: Color(0xff6d6d6d)),
                                              )
                                            ],
                                          ),
                                  ),
                                  SizedBox(
                                    height: 36,
                                  ),
                                  Text(
                                    "Sauvegarder l'état actuel de votre base de données.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0xff6d6d6d)),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 46,
                                    child: Obx(() => ElevatedButton(
                                        onPressed: controller
                                                    .isLoading1.value ||
                                                controller.isLoading2.value
                                            ? null
                                            : () {
                                                Get.defaultDialog(
                                                  title: "Attention !",
                                                  radius: 6,
                                                  middleText:
                                                      "S'il existe une sauvegarde, elle sera remplacée ! Voulez-vous continuer ?",
                                                  cancel: Container(
                                                    margin: EdgeInsets.only(
                                                        right: 16),
                                                    width: 100,
                                                    height: 40,
                                                    child: OutlinedButton(
                                                      onPressed: () {
                                                        Get.back(result: false);
                                                      },
                                                      child: Text("Non"),
                                                    ),
                                                  ),
                                                  confirm: Container(
                                                    width: 100,
                                                    height: 40,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        Get.back(result: true);
                                                      },
                                                      child: Text("Oui"),
                                                    ),
                                                  ),
                                                ).then((value) {
                                                  if (value == true) {
                                                    controller.isLoading1
                                                        .value = true;
                                                    controller
                                                        .saveDb()
                                                        .then((value) {
                                                      controller.isLoading1
                                                          .value = false;

                                                      Get.defaultDialog(
                                                        title: "Félicitation",
                                                        radius: 6,
                                                        middleText:
                                                            "Votre base de données a été sauvegardée avec succès!",
                                                        cancel: Container(
                                                          width: 100,
                                                          height: 40,
                                                          child: ElevatedButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Text("Ok"),
                                                          ),
                                                        ),
                                                      );
                                                    });
                                                  }
                                                });
                                              },
                                        child: controller.isLoading1.value
                                            ? CircularProgressIndicator()
                                            : Text("Sauvegarder"))),
                                  ),
                                  SizedBox(
                                    height: 36,
                                  ),
                                  Obx(() => Visibility(
                                        visible: controller.backupData.value,
                                        child: Text(
                                          "Un fichier de sauvegarde a été trouvé.",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Color(0xff6d6d6d)),
                                        ),
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Obx(() => Visibility(
                                        visible: controller.backupData.value,
                                        child: Container(
                                          height: 46,
                                          child: ElevatedButton(
                                            onPressed: controller
                                                        .isLoading1.value ||
                                                    controller.isLoading2.value
                                                ? null
                                                : () async {
                                                    Get.defaultDialog(
                                                      title: "Attention !",
                                                      radius: 6,
                                                      middleText:
                                                          "Vos données actuelles seront remplaccées par la sauvegarde ! Voulez-vous continuer ?",
                                                      cancel: Container(
                                                        margin: EdgeInsets.only(
                                                            right: 16),
                                                        width: 100,
                                                        height: 40,
                                                        child: OutlinedButton(
                                                          onPressed: () {
                                                            Get.back(
                                                                result: false);
                                                          },
                                                          child: Text("Non"),
                                                        ),
                                                      ),
                                                      confirm: Container(
                                                        width: 100,
                                                        height: 40,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            Get.back(
                                                                result: true);
                                                          },
                                                          child: Text("Oui"),
                                                        ),
                                                      ),
                                                    ).then((value) async {
                                                      if (value == true) {
                                                        controller.isLoading2
                                                            .value = true;
                                                        await controller
                                                            .restorDb()
                                                            .then((value) {
                                                          controller.isLoading2
                                                              .value = false;
                                                          Get.defaultDialog(
                                                            title:
                                                                "Félicitation",
                                                            radius: 6,
                                                            middleText:
                                                                "Votre base de données a été restorée avec succès!",
                                                            cancel: Container(
                                                              width: 100,
                                                              height: 40,
                                                              child:
                                                                  ElevatedButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                child:
                                                                    Text("Ok"),
                                                              ),
                                                            ),
                                                          ).then((value) =>
                                                              Get.back());
                                                        });
                                                      }
                                                    });
                                                  },
                                            child: controller.isLoading2.value
                                                ? CircularProgressIndicator()
                                                : Text("Restorer"),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          )
                        : Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                    onPressed: () {
                                      _build = controller.createDir();
                                      setState(() {});
                                    },
                                    child: Text("Réessayez"))
                              ],
                            ),
                          )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              })),
    );
  }
}
