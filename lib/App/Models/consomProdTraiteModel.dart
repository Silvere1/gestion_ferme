import 'lotModel.dart';
import 'produitTraiteModel.dart';

class ConsomProdTraite {
  int num;
  int qte;
  Produit produit;
  Lot lot;
  DateTime dateTime;
  ConsomProdTraite(this.num, this.qte, this.produit, this.lot, this.dateTime);
}

List<ConsomProdTraite> consomprodtraite = [
  ConsomProdTraite(1, 1, produits[4], lots[2], DateTime(2021, 6, 23)),
  ConsomProdTraite(1, 1, produits[4], lots[2], DateTime(2021, 6, 23)),
  ConsomProdTraite(1, 1, produits[4], lots[2], DateTime(2021, 6, 23)),
  ConsomProdTraite(1, 1, produits[4], lots[2], DateTime(2021, 6, 23)),
  ConsomProdTraite(1, 1, produits[4], lots[2], DateTime(2021, 6, 23)),
];
