import 'package:flutter/material.dart';
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
    _build = controller.createDir();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _build,
        builder: (_, snapshot) {
          return snapshot.hasData
              ? snapshot.data != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                controller.saveDb();
                              },
                              child: Text("Sauvegarder")),
                          SizedBox(
                            height: 56,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                controller.restorDb();
                              },
                              child: Text("Restorer")),
                        ],
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
        });
  }
}
