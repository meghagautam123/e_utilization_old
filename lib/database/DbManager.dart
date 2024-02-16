import 'package:e_utilization/model/EUCFormCameraModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbManager
{
  Database? _database = null;
 // static const _databaseName = "EFormCameraDatabase.db";
/*  static const _databaseVersion = 1;

  static const table = 'eform_camera_table';

  static const columnId = '_id';
  static const columnScheme = 'scheme';
  static const columnFY = 'FY';
  static const columnExpenditure = 'expenditure';
  static const columnLatitude = 'latitude';
  static const columnLongitude = 'longitude';
  static const columnRemark="remark";


  late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> init() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

// SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnScheme TEXT NOT NULL,
            $columnFY TEXT NOT NULL,
            $columnExpenditure TEXT NOT NULL,
            $columnLatitude TEXT NOT NULL,
            $columnLongitude TEXT NOT NULL,
            $columnRemark TEXT,
          )
          ''');
  }*/

  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), "EFormCameraDatabase.db"),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute(
            "CREATE TABLE eform_camera_table (id INTEGER PRIMARY KEY autoincrement, scheme TEXT NOT NULL, FY TEXT NOT NULL,expenditure TEXT NOT NULL,latitude TEXT NOT NULL,longitude TEXT NOT NULL,remark TEXT)"
              // )";
          );
        });
    return _database;
  }
  Future<int> insertUser(EUCForm user) async {
    final Database db = await openDb();
    return await db.insert('eform_camera_table', user.toMap());
  }
}