import 'package:gestionferme/App/Models/approProduitModel.dart';
import 'package:gestionferme/App/Models/approProvendeModel.dart';
import 'package:gestionferme/App/Models/collecteModel.dart';
import 'package:gestionferme/App/Models/consomEauModel.dart';
import 'package:gestionferme/App/Models/consomProdTraiteModel.dart';
import 'package:gestionferme/App/Models/consomProvendeModel.dart';
import 'package:gestionferme/App/Models/editStockOeufModel.dart';
import 'package:gestionferme/App/Models/editStockProduit.dart';
import 'package:gestionferme/App/Models/editStockProvende.dart';
import 'package:gestionferme/App/Models/editStockVolailleModel.dart';
import 'package:gestionferme/App/Models/lotModel.dart';
import 'package:gestionferme/App/Models/perteOeufsModel.dart';
import 'package:gestionferme/App/Models/perteVolaillesModel.dart';
import 'package:gestionferme/App/Models/produitTraiteModel.dart';
import 'package:gestionferme/App/Models/provendeModel.dart';
import 'package:gestionferme/App/Models/stockOeufsModel.dart';
import 'package:gestionferme/App/Models/usageOeufsModel.dart';
import 'package:gestionferme/App/Models/usageVolaillesModel.dart';
import 'package:gestionferme/App/Models/venteOeufsModel.dart';
import 'package:gestionferme/App/Models/venteVolaillesModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/utils/utils.dart';

class DataBaseProvider {
  static final _dataBaseName = "ferme.db";
  static final _dbVersion = 1;

  /// Using this class in singleton.
  DataBaseProvider._();
  static final DataBaseProvider instance = DataBaseProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDataBase();
    return _database!;
  }

  _initDataBase() async {
    return await openDatabase(
      join(await getDatabasesPath(), _dataBaseName),
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> deleteDataBase() async {
    databaseFactory
        .deleteDatabase(join(await getDatabasesPath(), _dataBaseName));
    print("Suppression Ok !!!");
  }

  Future<void> _onCreate(Database db, int version) async {
    final createTable = "CREATE TABLE";
    final intAutoKey = "INTEGER PRIMARY KEY AUTOINCREMENT";
    final integer = "INTEGER";
    final integerNoNull = "INTEGER NO NULL";
    final textType = "TEXT";
    final reelType = "REAL";

    /// Create table LOTS
    await db.execute('''
    $createTable ${Lot.tableName} (
    ${Lot.colid} $intAutoKey,
    ${Lot.colinitNbr} $integerNoNull,
    ${Lot.colnbrVolailles} $integerNoNull,
    ${Lot.colage} $integerNoNull,
    ${Lot.coltype} $integer,
    ${Lot.colmontant} $integer,
    ${Lot.colcreateAt} $textType,
    ${Lot.colbuyAt} $textType,
    ${Lot.colselect} $integer,
    ${Lot.colarchive} $integer,
    ${Lot.colarchiveAt} $textType
    )
    ''');

    /// Create table PROVENDES
    await db.execute('''
    $createTable ${Provende.tableName} (
    ${Provende.colid} $intAutoKey,
    ${Provende.colnom} $textType,
    ${Provende.colunite} $textType,
    ${Provende.colqte} $reelType,
    ${Provende.colvalue} $reelType,
    ${Provende.colcreateAt} $textType
    )
    ''');

    /// Create table PRODUITS
    await db.execute('''
    $createTable ${Produit.tableName} (
    ${Produit.colid} $intAutoKey,
    ${Produit.colnom} $textType,
    ${Produit.colunite} $textType,
    ${Produit.colqte} $reelType,
    ${Produit.colvalue} $reelType,
    ${Produit.colcreateAt} $textType
    )
    ''');

    /// Create table CONSOMMEPROVENDE
    await db.execute('''
    $createTable ${ConsomProvende.tableName} (
    ${ConsomProvende.colid} $intAutoKey,
    ${ConsomProvende.colLot} $textType,
    ${ConsomProvende.colProvende} $textType,
    ${ConsomProvende.colqte} $reelType,
    ${ConsomProvende.colOrderService} $integer,  
    ${ConsomProvende.colcreateAt} $textType
    )
    ''');

    /// Create table CONSOMMEPRODUITS
    await db.execute('''
    $createTable ${ConsomProdTraite.tableName} (
    ${ConsomProdTraite.colid} $intAutoKey,
    ${ConsomProdTraite.colLot} $textType,
    ${ConsomProdTraite.colproduit} $textType,
    ${ConsomProdTraite.colqte} $reelType,
    ${ConsomProdTraite.colcreateAt} $textType
    )
    ''');

    /// Create table CONSOMMEEAU
    await db.execute('''
    $createTable ${ConsomEau.tableName} (
    ${ConsomEau.colid} $intAutoKey,
    ${ConsomEau.colLot} $textType,
    ${ConsomEau.colqte} $reelType,
    ${ConsomEau.colcreateAt} $textType
    )
    ''');

    /// Create table COLLECTEOEUFS
    await db.execute('''
    $createTable ${CollecteOeuf.tableName} (
    ${CollecteOeuf.colid} $intAutoKey,
    ${CollecteOeuf.colLot} $textType,
    ${CollecteOeuf.colpetits} $integer,
    ${CollecteOeuf.colmoyens} $integer,
    ${CollecteOeuf.colgrands} $integer,
    ${CollecteOeuf.colfeles} $integer,
    ${CollecteOeuf.colcreateAt} $textType
    )
    ''');

    /// Create table VENTECTEOEUFS
    await db.execute('''
    $createTable ${VenteOeuf.tableName} (
    ${VenteOeuf.colid} $intAutoKey,
    ${VenteOeuf.colpetits} $integer,
    ${VenteOeuf.colmoyens} $integer,
    ${VenteOeuf.colgrands} $integer,
    ${VenteOeuf.colmontant} $reelType,
    ${VenteOeuf.colcreateAt} $textType
    )
    ''');

    /// Create table VENTEVOLAILLES
    await db.execute('''
    $createTable ${VenteVolailles.tableName} (
    ${VenteVolailles.colid} $intAutoKey,
    ${VenteVolailles.colLot} $textType,
    ${VenteVolailles.colqte} $integer,
    ${VenteVolailles.colmontant} $reelType,
    ${VenteVolailles.colcreateAt} $textType
    )
    ''');

    /// Create table PERTEOEUFS
    await db.execute('''
    $createTable ${PerteOeufs.tableName} (
    ${PerteOeufs.colid} $intAutoKey,
    ${PerteOeufs.colpetits} $integer,
    ${PerteOeufs.colmoyens} $integer,
    ${PerteOeufs.colgrands} $integer,
    ${PerteOeufs.colmotif} $textType,
    ${PerteOeufs.colcreateAt} $textType
    )
    ''');

    /// Create table PERTEVOLAILLES
    await db.execute('''
    $createTable ${PerteVolailles.tableName} (
    ${PerteVolailles.colid} $intAutoKey,
    ${PerteVolailles.colLot} $textType,
    ${PerteVolailles.colqte} $integer,
    ${PerteVolailles.colmotif} $textType,
    ${PerteVolailles.colcreateAt} $textType
    )
    ''');

    /// Create table USEDOEUFS
    await db.execute('''
    $createTable ${UsedOeufs.tableName} (
    ${UsedOeufs.colid} $intAutoKey,
    ${UsedOeufs.colpetits} $integer,
    ${UsedOeufs.colmoyens} $integer,
    ${UsedOeufs.colgrands} $integer,
    ${UsedOeufs.colmotif} $textType,
    ${UsedOeufs.colcreateAt} $textType
    )
    ''');

    /// Create table USEDVOLAILLES
    await db.execute('''
    $createTable ${UsedVolailles.tableName} (
    ${UsedVolailles.colid} $intAutoKey,
    ${UsedVolailles.colLot} $textType,
    ${UsedVolailles.colqte} $integer,
    ${UsedVolailles.colmotif} $textType,
    ${UsedVolailles.colcreateAt} $textType
    )
    ''');

    /// Create table APPROPROVENTE
    await db.execute('''
    $createTable ${ApproProvende.tableName} (
    ${ApproProvende.colid} $intAutoKey,
    ${ApproProvende.colProvende} $textType,
    ${ApproProvende.colqte} $reelType, 
    ${ApproProvende.colvalue} $reelType,
    ${ApproProvende.colisAdd} $integer,
    ${ApproProvende.colcreateAt} $textType
    )
    ''');

    /// Create table APPROPRODUIT
    await db.execute('''
    $createTable ${ApproProduit.tableName} (
    ${ApproProduit.colid} $intAutoKey,
    ${ApproProduit.colProduit} $textType,
    ${ApproProduit.colqte} $reelType, 
    ${ApproProduit.colvalue} $reelType,
    ${ApproProduit.colisAdd} $integer,
    ${ApproProduit.colcreateAt} $textType
    )
    ''');

    /// Create table EDITESTOCKOEUF
    await db.execute('''
    $createTable ${EditStockOeuf.tableName} (
    ${EditStockOeuf.colid} $intAutoKey,
    ${EditStockOeuf.colStock} $textType,
    ${EditStockOeuf.colpetits} $integer,
    ${EditStockOeuf.colmoyens} $integer, 
    ${EditStockOeuf.colgrands} $integer,
    ${EditStockOeuf.colcreateAt} $textType
    )
    ''');

    /// Create table EDITESTOCKVOLAILLES
    await db.execute('''
    $createTable ${EditStockVolailles.tableName} (
    ${EditStockVolailles.colid} $intAutoKey,
    ${EditStockVolailles.colLot} $textType,
    ${EditStockVolailles.colqte} $integer, 
    ${EditStockVolailles.colcreateAt} $textType
    )
    ''');

    /// Create table EDITESTOCKPROVENDE
    await db.execute('''
    $createTable ${EditStockProvende.tableName} (
    ${EditStockProvende.colid} $intAutoKey,
    ${EditStockProvende.colProvende} $textType,
    ${EditStockProvende.colqte} $reelType, 
    ${EditStockProvende.colcreateAt} $textType
    )
    ''');

    /// Create table EDITESTOCKPRODUIT
    await db.execute('''
    $createTable ${EditStockProduit.tableName} (
    ${EditStockProduit.colid} $intAutoKey,
    ${EditStockProduit.colProduit} $textType,
    ${EditStockProduit.colqte} $reelType, 
    ${EditStockProduit.colcreateAt} $textType
    )
    ''');

    /// Create table STOCKOEUFS
    await db.execute('''
    $createTable ${StockOeuf.tableName} (
    ${StockOeuf.colkey} $textType,
    ${StockOeuf.colpetits} $integer,
    ${StockOeuf.colmoyens} $integer, 
    ${StockOeuf.colgrands} $integer,
    ${StockOeuf.coltotal} $integer
    )
    ''');

    print("\n\nToutes les Tables sont créés avec succès !!!\n\n");
  }

  ///List table names
  Future<List<String>> getTableNames() async {
    Database db = await instance.database;
    var tableNames = (await db
            .query('sqlite_master', where: 'type = ?', whereArgs: ['table']))
        .map((row) => row['name'] as String)
        .toList(growable: false)
          ..sort();
    print(tableNames);

    var res = await db.query(StockOeuf.tableName);
    if (res.isEmpty) {
      await _initTableSTOCKOEUF();
      res = await db.query(StockOeuf.tableName);
      print(res);
    }

    return tableNames;
  }

  ///Check if a table exists
  Future<bool> tableExists(DatabaseExecutor db, String table) async {
    var count = firstIntValue(await db.query('sqlite_master',
        columns: ['COUNT(*)'],
        where: 'type = ? AND name = ?',
        whereArgs: ['table', table]));
    return count! > 0;
  }

  /// Insert lot in table LOTS
  Future<int> insertLot(Lot lot) async {
    Database db = await instance.database;
    var res = db.insert(Lot.tableName, lot.toJson());
    return res;
  }

  /// Insert provende in table PROVENDES
  Future<int> insertProvende(Provende provende) async {
    Database db = await instance.database;
    var res = db.insert(Provende.tableName, provende.toJson());
    return res;
  }

  /// Insert produit in table PRODUIT
  Future<int> insertProduit(Produit produit) async {
    Database db = await instance.database;
    var res = db.insert(Produit.tableName, produit.toJson());
    return res;
  }

  /// Insert consomProvende in table CONSOMPROVENDE
  Future<int> insertConsomProvende(ConsomProvende consomProvende) async {
    Database db = await instance.database;
    var res = db.insert(ConsomProvende.tableName, consomProvende.toJson());
    return res;
  }

  /// Insert consomProduit in table CONSOMMEPRODUITS
  Future<int> insertConsomProduit(ConsomProdTraite consomProdTraite) async {
    Database db = await instance.database;
    var res = db.insert(ConsomProdTraite.tableName, consomProdTraite.toJson());
    return res;
  }

  /// Insert consomEau in table CONSOMMEEAU
  Future<int> insertConsomEau(ConsomEau consomEau) async {
    Database db = await instance.database;
    var res = db.insert(ConsomEau.tableName, consomEau.toJson());
    return res;
  }

  /// Insert collecteOeuf in table COLLECTEOEUF
  Future<int> insertCollecteOeuf(CollecteOeuf collecteOeuf) async {
    Database db = await instance.database;
    var res = db.insert(CollecteOeuf.tableName, collecteOeuf.toJson());
    return res;
  }

  /// Insert venteOeuf in table VENTEOEUFS
  Future<int> insertVenteOeuf(VenteOeuf venteOeuf) async {
    Database db = await instance.database;
    var res = db.insert(VenteOeuf.tableName, venteOeuf.toJson());
    return res;
  }

  /// Insert venteVolaille in table VENTEVOLAILLES
  Future<int> insertVenteVolailles(VenteVolailles venteVolailles) async {
    Database db = await instance.database;
    var res = db.insert(VenteVolailles.tableName, venteVolailles.toJson());
    return res;
  }

  /// Insert perteOeuf in table PERTEOEUFS
  Future<int> insertPerteOeuf(PerteOeufs perteOeufs) async {
    Database db = await instance.database;
    var res = db.insert(PerteOeufs.tableName, perteOeufs.toJson());
    return res;
  }

  /// Insert perteVolaille in table PERTEVOLAILLES
  Future<int> insertPerteVolailles(PerteVolailles perteVolailles) async {
    Database db = await instance.database;
    var res = db.insert(PerteVolailles.tableName, perteVolailles.toJson());
    return res;
  }

  /// Insert usedOeuf in table USEDOEUFS
  Future<int> insertUsedOeuf(UsedOeufs usedOeufs) async {
    Database db = await instance.database;
    var res = db.insert(UsedOeufs.tableName, usedOeufs.toJson());
    return res;
  }

  /// Insert usedVolaille in table USEDVOLAILLES
  Future<int> insertUsedVolailles(UsedVolailles usedVolailles) async {
    Database db = await instance.database;
    var res = db.insert(UsedVolailles.tableName, usedVolailles.toJson());
    return res;
  }

  /// Insert approProvende in table APPROPROVENDE
  Future<int> insertApproProvende(ApproProvende approProvende) async {
    Database db = await instance.database;
    var res = db.insert(ApproProvende.tableName, approProvende.toJson());
    return res;
  }

  /// Insert approProduit in table APPROPRODUIT
  Future<int> insertApproProduit(ApproProduit approProduit) async {
    Database db = await instance.database;
    var res = db.insert(ApproProduit.tableName, approProduit.toJson());
    return res;
  }

  /// Insert editeStockOeuf in table EDITESTOCKOEUF
  Future<int> insertEditStockOeuf(EditStockOeuf editStockOeuf) async {
    Database db = await instance.database;
    var res = db.insert(EditStockOeuf.tableName, editStockOeuf.toJson());
    return res;
  }

  /// Insert editeStockVolaille in table EDITESTOCKVOLAILLES
  Future<int> insertEditStockVolailles(
      EditStockVolailles editStockVolailles) async {
    Database db = await instance.database;
    var res =
        db.insert(EditStockVolailles.tableName, editStockVolailles.toJson());
    return res;
  }

  /// Insert editeStockProvende in table EDITESTOCKPROVENDE
  Future<int> insertEditStockProvende(
      EditStockProvende editStockProvende) async {
    Database db = await instance.database;
    var res =
        db.insert(EditStockProvende.tableName, editStockProvende.toJson());
    return res;
  }

  /// Insert editeStockProduit in table EDITESTOCKPRODUIT
  Future<int> insertEditStockProduit(EditStockProduit editStockProduit) async {
    Database db = await instance.database;
    var res = db.insert(EditStockProduit.tableName, editStockProduit.toJson());
    return res;
  }

  /// Get All lots
  Future<List<Lot>> getLots() async {
    Database db = await instance.database;
    var res = await db.query(Lot.tableName);
    List<Lot> list =
        res.isNotEmpty ? res.map((e) => Lot.fromJson(e)).toList() : [];
    return list;
  }

  /// Get All collecteOeuf
  Future<List<CollecteOeuf>> getCollecteOeuf() async {
    Database db = await instance.database;
    var res = await db.query(CollecteOeuf.tableName);
    List<CollecteOeuf> list =
        res.isNotEmpty ? res.map((e) => CollecteOeuf.fromJson(e)).toList() : [];
    return list;
  }

  /// Get All venteOeufs
  Future<List<VenteOeuf>> getVenteOeufs() async {
    Database db = await instance.database;
    var res = await db.query(VenteOeuf.tableName);
    List<VenteOeuf> list =
        res.isNotEmpty ? res.map((e) => VenteOeuf.fromJson(e)).toList() : [];
    return list;
  }

  /// Get All ventevolaille
  Future<List<VenteVolailles>> getVenteVolailles() async {
    Database db = await instance.database;
    var res = await db.query(VenteVolailles.tableName);
    List<VenteVolailles> list = res.isNotEmpty
        ? res.map((e) => VenteVolailles.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Get All perteOeuf
  Future<List<PerteOeufs>> getPerteOeuf() async {
    Database db = await instance.database;
    var res = await db.query(PerteOeufs.tableName);
    List<PerteOeufs> list =
        res.isNotEmpty ? res.map((e) => PerteOeufs.fromJson(e)).toList() : [];
    return list;
  }

  /// Get All perteVolailles
  Future<List<PerteVolailles>> getPerteVolailles() async {
    Database db = await instance.database;
    var res = await db.query(PerteVolailles.tableName);
    List<PerteVolailles> list = res.isNotEmpty
        ? res.map((e) => PerteVolailles.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Get All usedOeuf
  Future<List<UsedOeufs>> getUsedOeuf() async {
    Database db = await instance.database;
    var res = await db.query(UsedOeufs.tableName);
    List<UsedOeufs> list =
        res.isNotEmpty ? res.map((e) => UsedOeufs.fromJson(e)).toList() : [];
    return list;
  }

  /// Get All usedVolailles
  Future<List<UsedVolailles>> getUsedVolailles() async {
    Database db = await instance.database;
    var res = await db.query(UsedVolailles.tableName);
    List<UsedVolailles> list = res.isNotEmpty
        ? res.map((e) => UsedVolailles.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Get All consomProvende
  Future<List<ConsomProvende>> getConsProvende() async {
    Database db = await instance.database;
    var res = await db.query(ConsomProvende.tableName);
    List<ConsomProvende> list = res.isNotEmpty
        ? res.map((e) => ConsomProvende.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Get All consomProduit
  Future<List<ConsomProdTraite>> getConsProduit() async {
    Database db = await instance.database;
    var res = await db.query(ConsomProdTraite.tableName);
    List<ConsomProdTraite> list = res.isNotEmpty
        ? res.map((e) => ConsomProdTraite.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Get All consomEau
  Future<List<ConsomEau>> getConsEau() async {
    Database db = await instance.database;
    var res = await db.query(ConsomEau.tableName);
    List<ConsomEau> list =
        res.isNotEmpty ? res.map((e) => ConsomEau.fromJson(e)).toList() : [];
    return list;
  }

  /// Get All editStockOeuf
  Future<List<EditStockOeuf>> getEditStockOeuf() async {
    Database db = await instance.database;
    var res = await db.query(EditStockOeuf.tableName);
    List<EditStockOeuf> list = res.isNotEmpty
        ? res.map((e) => EditStockOeuf.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Get All editStockVolailles
  Future<List<EditStockVolailles>> getEditStockVolailles() async {
    Database db = await instance.database;
    var res = await db.query(EditStockVolailles.tableName);
    List<EditStockVolailles> list = res.isNotEmpty
        ? res.map((e) => EditStockVolailles.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Get All editStockProvende
  Future<List<EditStockProvende>> getEditStockProvende() async {
    Database db = await instance.database;
    var res = await db.query(EditStockProvende.tableName);
    List<EditStockProvende> list = res.isNotEmpty
        ? res.map((e) => EditStockProvende.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Get All editStockProduit
  Future<List<EditStockProduit>> getEditStockProduit() async {
    Database db = await instance.database;
    var res = await db.query(EditStockProduit.tableName);
    List<EditStockProduit> list = res.isNotEmpty
        ? res.map((e) => EditStockProduit.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Get All provendes
  Future<List<Provende>> getProvendes() async {
    Database db = await instance.database;
    var res = await db.query(Provende.tableName);
    List<Provende> list =
        res.isNotEmpty ? res.map((e) => Provende.fromJson(e)).toList() : [];
    return list;
  }

  /// Get All produits
  Future<List<Produit>> getProduits() async {
    Database db = await instance.database;
    var res = await db.query(Produit.tableName);
    List<Produit> list =
        res.isNotEmpty ? res.map((e) => Produit.fromJson(e)).toList() : [];
    return list;
  }

  /// Get All approProvendes
  Future<List<ApproProvende>> getApproProvendes() async {
    Database db = await instance.database;
    var res = await db.query(ApproProvende.tableName);
    List<ApproProvende> list = res.isNotEmpty
        ? res.map((e) => ApproProvende.fromJson(e)).toList()
        : [];
    return list;
  }

  /// Get All approProduits
  Future<List<ApproProduit>> getApproProduits() async {
    Database db = await instance.database;
    var res = await db.query(ApproProduit.tableName);
    List<ApproProduit> list =
        res.isNotEmpty ? res.map((e) => ApproProduit.fromJson(e)).toList() : [];
    return list;
  }

  Future<int> detleteLot(int i) async {
    Database db = await instance.database;
    return await db
        .delete(Lot.tableName, where: "${Lot.colid} = ?", whereArgs: [i]);
  }

  Future<int> updateLot(Lot lot) async {
    Database db = await instance.database;
    return await db.update(Lot.tableName, lot.toJson(),
        where: "${Lot.colid} = ?", whereArgs: [lot.num]);
  }

  /// update Provende
  Future<int> updateProvende(Provende provende) async {
    Database db = await instance.database;
    return await db.update(Provende.tableName, provende.toJson(),
        where: "${Provende.colnom} = ?", whereArgs: [provende.nom]);
  }

  /// update Produit
  Future<int> updateProduit(Produit produit) async {
    Database db = await instance.database;
    return await db.update(Produit.tableName, produit.toJson(),
        where: "${Produit.colnom} = ?", whereArgs: [produit.nom]);
  }

  /// Rename Provende
  Future<int> updateNameProvende(Provende provende, String lastName) async {
    Database db = await instance.database;
    return await db.update(Provende.tableName, provende.toJson(),
        where: "${Provende.colnom} = ?", whereArgs: [lastName]);
  }

  /// Rename Produit
  Future<int> updateNameProduit(Produit produit, String lastName) async {
    Database db = await instance.database;
    return await db.update(Produit.tableName, produit.toJson(),
        where: "${Produit.colnom} = ?", whereArgs: [lastName]);
  }

  /// init values in  STOCKOEUF table
  Future<void> _initTableSTOCKOEUF() async {
    StockOeuf stockOeuf = StockOeuf("key", 0, 0, 0, 0);
    Database db = await instance.database;
    await db.insert(StockOeuf.tableName, stockOeuf.toJson());
  }

  /// update StockOeuf
  Future<int> updateStockOeuf(StockOeuf stockOeuf) async {
    Database db = await instance.database;
    return await db.update(StockOeuf.tableName, stockOeuf.toJson(),
        where: "${StockOeuf.colkey} = ?", whereArgs: [stockOeuf.key]);
  }

  /// Get stock Oeufs
  Future<StockOeuf> getStockOeuf() async {
    Database db = await instance.database;
    var res = await db.query(StockOeuf.tableName);
    /*if (res.isEmpty) {
      await _initTableSTOCKOEUF();
      res = await db.query(StockOeuf.tableName);
      print(res);
    }*/
    print(res);
    return StockOeuf.fromJson(res.first);
  }
}
