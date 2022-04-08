import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gestionferme/App/Controllers/backupController.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'App/Controllers/addLotController.dart';
import 'App/Controllers/approController.dart';
import 'App/Controllers/collecteOeufsController.dart';
import 'App/Controllers/consommationController.dart';
import 'App/Controllers/editStockController.dart';
import 'App/Controllers/ficheController.dart';
import 'App/Controllers/perteController.dart';
import 'App/Controllers/proFicheController.dart';
import 'App/Controllers/screenSizeController.dart';
import 'App/Controllers/stockFicheController.dart';
import 'App/Controllers/usageController.dart';
import 'App/Controllers/venteController.dart';
import 'Screens/MainScreen/mainScreen.dart';
import 'Theme/themeColorGenerator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  if (Platform.isWindows || Platform.isLinux) {
    // Initialize FFI
    sqfliteFfiInit();
    // Change the default factory
    databaseFactory = databaseFactoryFfi;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GestionFerme",
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [Locale("fr")],
      theme: ThemeData(
        primarySwatch: generatorMaterialColor(Color(0xff006A34)),
        backgroundColor: Color(0xffeeeeee),
      ),
      defaultTransition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 250),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(MenuController());
        Get.put(AddLotController());
        Get.put(ApproController());
        Get.put(ConsommationController());
        Get.put(PerteController());
        Get.put(CollecteOeufsController());
        Get.put(VenteController());
        Get.put(UsageController());
        Get.put(EditStockController());
        Get.put(FicheController());
        Get.put(StockFicheController());
        Get.put(ProFicheController());
        Get.put(BackupController());
      }),
    );
  }
}
