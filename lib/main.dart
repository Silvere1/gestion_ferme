import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'Screens/MainScreen/mainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [Locale("fr")],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 250),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
