
import 'package:iflower/Models/Flower.dart';
import 'package:iflower/Repository/DBProvider.dart';
import 'package:iflower/Repository/DataRepository.dart';
import 'package:sqflite/sqflite.dart';

class SqlRepository extends DataRepository {

  late DBProvider _dbp;

  SqlRepository() {
    _dbp = DBProvider.instance;
  }

  @override
  Future<bool> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Flower> getById(int id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<int> insert(Flower f) async {
    Database? db = await _dbp.database;
    String SQL = "INSERT INTO flowers (name, description, size, color) VALUE ('${f.name}', '${f.description}', '${f.size}', '${f.color}')";
    //print(SQL);
    int? id = await db?.rawInsert(SQL);
    return id ?? -1;

  }

  @override
  Future<bool> put(Flower f) {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<List<Flower>> search(FlowerColor? color, FlowerSize? size) {
    // TODO: implement search
    throw UnimplementedError();
  }

  @override
  Future<List<Flower>> getAll() async {
    Database? db = await _dbp.database;
    List<Map<String, Object?>>? rs= await db?.rawQuery("SELECT id, name, description, size, color FROM flowers ORDER BY id");
    List<Flower> result = [];
    if (rs != null){
     result =  rs.map((e) => Flower.fromRow(e)).toList();
    }
    return result;
  }
}
