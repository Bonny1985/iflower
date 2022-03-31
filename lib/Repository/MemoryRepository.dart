import 'package:iflower/Models/Flower.dart';
import 'package:iflower/Repository/DataRepository.dart';
import 'package:iflower/Repository/MemoryProvider.dart';

class MemoryRepository extends DataRepository {
  MemoryProvider _dbp = MemoryProvider.instance;

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
  Future<int?> insert(Flower f) async {
    List<Flower> db = await _dbp.database;
    var id = DateTime.now().millisecondsSinceEpoch;
    f.id = id;
    db.add(f);
    return id;
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
  Future<List<Flower>?> getAll() async {
    return await _dbp.database;
  }
}
