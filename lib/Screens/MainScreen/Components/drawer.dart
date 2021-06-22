import 'package:flutter/material.dart';
import 'package:gestionferme/App/Controllers/screenSizeController.dart';
import 'package:gestionferme/App/Models/dTitleModel.dart';

class SideDrawerMenu extends StatelessWidget {
  SideDrawerMenu(
    this.menuController,
  );
  final MenuController menuController;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Gestion de Poules pondeuses",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xffD5E5FF),
              ),
            ),
            ListTile(
              title: Text("Tableau de bord"),
              selected: titres[0].selected,
              selectedTileColor: Color(0xffD5E5FF),
              onTap: () async {
                menuController.selectedItem(0, 0, 0, "Tableau de bord");
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              title: Text("Matières Premières"),
              initiallyExpanded: titres[1].selected,
              children: [
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Lots de Volailles",
                    ),
                  ),
                  selected: titres[1].subtitle[0].selected,
                  selectedTileColor: Color(0xffD5E5FF),
                  onTap: () {
                    menuController.selectedItem(1, 0, 1, "Lots de Volailles");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Approvisionnements",
                    ),
                  ),
                  selected: titres[1].subtitle[1].selected,
                  selectedTileColor: Color(0xffD5E5FF),
                  onTap: () {
                    menuController.selectedItem(1, 1, 2, "Approvisionnements");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Consommations",
                    ),
                  ),
                  selectedTileColor: Color(0xffD5E5FF),
                  selected: titres[1].subtitle[2].selected,
                  onTap: () {
                    menuController.selectedItem(1, 2, 3, "Consommations");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Produits Finis"),
              initiallyExpanded: titres[2].selected,
              children: [
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Collecte d'Oeufs",
                    ),
                  ),
                  selected: titres[2].subtitle[0].selected,
                  selectedTileColor: Color(0xffD5E5FF),
                  onTap: () {
                    menuController.selectedItem(2, 0, 4, "Collecte d'Oeufs");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Ventes",
                    ),
                  ),
                  selected: titres[2].subtitle[1].selected,
                  selectedTileColor: Color(0xffD5E5FF),
                  onTap: () {
                    menuController.selectedItem(2, 1, 5, "Ventes");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Pertes",
                    ),
                  ),
                  selected: titres[2].subtitle[2].selected,
                  selectedTileColor: Color(0xffD5E5FF),
                  onTap: () {
                    menuController.selectedItem(2, 2, 6, "Pertes");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Usages",
                    ),
                  ),
                  selected: titres[2].subtitle[3].selected,
                  selectedTileColor: Color(0xffD5E5FF),
                  onTap: () {
                    menuController.selectedItem(2, 3, 7, "Usages");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Stocks"),
              initiallyExpanded: titres[3].selected,
              children: [
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Matières Premières",
                    ),
                  ),
                  selected: titres[3].subtitle[0].selected,
                  selectedTileColor: Color(0xffD5E5FF),
                  onTap: () {
                    menuController.selectedItem(
                        3, 0, 8, "Stock / Matières Premières");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Produits Finis",
                    ),
                  ),
                  selected: titres[3].subtitle[1].selected,
                  selectedTileColor: Color(0xffD5E5FF),
                  onTap: () {
                    menuController.selectedItem(
                        3, 1, 9, "Stock / Produits Finis");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      "Archives",
                    ),
                  ),
                  selected: titres[3].subtitle[2].selected,
                  selectedTileColor: Color(0xffD5E5FF),
                  onTap: () {
                    menuController.selectedItem(3, 2, 10, "Archives");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
