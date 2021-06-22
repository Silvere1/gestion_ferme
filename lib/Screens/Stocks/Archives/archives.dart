import 'package:flutter/material.dart';
import 'package:gestionferme/App/Models/archiveModel.dart';

import 'Widgets/itemArchive.dart';

class Archives extends StatefulWidget {
  const Archives();

  @override
  _ArchivesState createState() => _ArchivesState();
}

class _ArchivesState extends State<Archives> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      physics: BouncingScrollPhysics(),
      itemCount: archives.length,
      itemBuilder: (context, i) => ItemArchive(i),
    );
  }
}
