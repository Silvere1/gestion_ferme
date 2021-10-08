import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gestionferme/App/Controllers/screenSizeController.dart';
import 'package:gestionferme/App/Models/dTitleModel.dart';

class SideDrawerMenu extends StatefulWidget {
  const SideDrawerMenu(this.menuController);
  final MenuController menuController;

  @override
  _SideDrawerMenuState createState() => _SideDrawerMenuState(menuController);
}

class _SideDrawerMenuState extends State<SideDrawerMenu> {
  final MenuController menuController;
  /*Color _color = Color(0xff8DBCA4);*/

  _SideDrawerMenuState(this.menuController);

  @override
  Widget build(BuildContext context) {
    Color _color = Color(0xffdfdfdf);
    return Drawer(
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 46),
        child: Column(
          children: [
            DrawerHeader(
              child: Center(
                /*child: Text(
                  "Gestion de Poules pondeuses",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),*/
                child: Image.asset("assets/icons/Logo GF (3).png"),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    margin: EdgeInsets.only(right: 10, left: 0),
                    child: SvgPicture.asset(
                      "assets/icons/dashboard_layout.svg",
                      color: titres[0].subtitle[0].selected
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                  ),
                  Text(
                    "Tableau de bord",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              selected: titres[0].selected,
              selectedTileColor: _color,
              onTap: () async {
                menuController.selectedItem(0, 0, 0, "Tableau de bord");
                Navigator.pop(context);
              },
            ),
            /*ExpansionTile(
              title: Text(
                "Matières Premières",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              initiallyExpanded: titres[1].selected,
              onExpansionChanged: (value) {
                titres[1].selected = value;
              },
              children: [
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28,
                          margin: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/lots.svg",
                            color: titres[1].subtitle[0].selected
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        Text(
                          "Lots de Volailles",
                        ),
                      ],
                    ),
                  ),
                  selected: titres[1].subtitle[0].selected,
                  selectedTileColor: _color,
                  onTap: () {
                    titres[0].selected = false;
                    menuController.selectedItem(1, 0, 1, "Lots de Volailles");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28,
                          margin: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/appro.svg",
                            color: titres[1].subtitle[1].selected
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        Text(
                          "Approvisionnements",
                        ),
                      ],
                    ),
                  ),
                  selected: titres[1].subtitle[1].selected,
                  selectedTileColor: _color,
                  onTap: () {
                    titres[0].selected = false;
                    menuController.selectedItem(1, 1, 2, "Approvisionnements");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),*/
            ExpansionTile(
              title: Row(
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    margin: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      "assets/icons/poulailler.svg",
                      color: titres[1].selected
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                  ),
                  Text(
                    "Poulailler",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              initiallyExpanded: titres[1].selected,
              onExpansionChanged: (value) {
                titres[1].selected = value;
                setState(() {});
              },
              children: [
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28,
                          margin: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/consom.svg",
                            color: titres[1].subtitle[0].selected
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        Text(
                          "Alimentations",
                        ),
                      ],
                    ),
                  ),
                  selectedTileColor: _color,
                  selected: titres[1].subtitle[0].selected,
                  onTap: () {
                    titres[0].selected = false;
                    menuController.selectedItem(1, 0, 1, "Alimentations");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28,
                          margin: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/collecte.svg",
                            color: titres[1].subtitle[1].selected
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        Text(
                          "Collecte d'Oeufs",
                        ),
                      ],
                    ),
                  ),
                  selected: titres[1].subtitle[1].selected,
                  selectedTileColor: _color,
                  onTap: () {
                    titres[0].selected = false;
                    menuController.selectedItem(1, 1, 2, "Collecte d'Oeufs");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28,
                          margin: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/perte.svg",
                            color: titres[1].subtitle[2].selected
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        Text(
                          "Pertes",
                        ),
                      ],
                    ),
                  ),
                  selected: titres[1].subtitle[2].selected,
                  selectedTileColor: _color,
                  onTap: () {
                    titres[0].selected = false;
                    menuController.selectedItem(1, 2, 3, "Pertes");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28,
                          margin: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/use.svg",
                            color: titres[1].subtitle[3].selected
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        Text(
                          "Utilisations",
                        ),
                      ],
                    ),
                  ),
                  selected: titres[1].subtitle[3].selected,
                  selectedTileColor: _color,
                  onTap: () {
                    titres[0].selected = false;
                    menuController.selectedItem(1, 3, 4, "Utilisations");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              title: Container(
                child: Row(
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      margin: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        "assets/icons/vente.svg",
                        color: titres[2].subtitle[0].selected
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                    ),
                    Text(
                      "Ventes",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
              ),
              selected: titres[2].subtitle[0].selected,
              selectedTileColor: _color,
              onTap: () {
                titres[0].selected = false;
                menuController.selectedItem(2, 0, 5, "Ventes");
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              title: Row(
                children: [
                  Container(
                    height: 28,
                    width: 28,
                    margin: EdgeInsets.only(right: 10),
                    child: SvgPicture.asset(
                      "assets/icons/depot.svg",
                      color: titres[3].selected
                          ? Theme.of(context).primaryColor
                          : null,
                    ),
                  ),
                  Text(
                    "Stocks",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              initiallyExpanded: titres[3].selected,
              onExpansionChanged: (value) {
                titres[3].selected = value;
                setState(() {});
              },
              children: [
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28,
                          margin: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/matierfist.svg",
                            color: titres[3].subtitle[0].selected
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        Text(
                          "Matières Premières",
                        ),
                      ],
                    ),
                  ),
                  selected: titres[3].subtitle[0].selected,
                  selectedTileColor: _color,
                  onTap: () {
                    titres[0].selected = false;
                    menuController.selectedItem(
                        3, 0, 6, "Stock / Matières Premières");
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        Container(
                          height: 28,
                          width: 28,
                          margin: EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            "assets/icons/prodfini.svg",
                            color: titres[3].subtitle[1].selected
                                ? Theme.of(context).primaryColor
                                : null,
                          ),
                        ),
                        Text(
                          "Produits Finis",
                        ),
                      ],
                    ),
                  ),
                  selected: titres[3].subtitle[1].selected,
                  selectedTileColor: _color,
                  onTap: () {
                    titres[0].selected = false;
                    menuController.selectedItem(
                        3, 1, 7, "Stock / Produits Finis");
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              title: Container(
                child: Row(
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      margin: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        "assets/icons/archive.svg",
                        color: titres[4].subtitle[0].selected
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                    ),
                    Text(
                      "Archives",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
              ),
              selected: titres[4].subtitle[0].selected,
              selectedTileColor: _color,
              onTap: () {
                titres[0].selected = false;
                menuController.selectedItem(4, 0, 8, "Archives");
                Navigator.pop(context);
              },
            ),
            /*ListTile(
              title: Container(
                child: Row(
                  children: [
                    Container(
                      height: 28,
                      width: 28,
                      margin: EdgeInsets.only(right: 10),
                      child: SvgPicture.asset(
                        "assets/icons/data_backup.svg",
                        color: titres[5].subtitle[0].selected
                            ? Theme.of(context).primaryColor
                            : null,
                      ),
                    ),
                    Text(
                      "Sauvegarde",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ],
                ),
              ),
              selected: titres[5].subtitle[0].selected,
              selectedTileColor: _color,
              onTap: () {
                titres[0].selected = false;
                menuController.selectedItem(5, 0, 9, "Sauvegarde");
                Navigator.pop(context);
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
