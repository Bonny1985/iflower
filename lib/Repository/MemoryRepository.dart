import 'package:iflower/Models/Flower.dart' show Flower, FlowerColor, FlowerSize;
import 'package:iflower/Repository/DataRepository.dart';
import 'package:iflower/Repository/MemoryProvider.dart';

class MemoryRepository extends DataRepository {
  late MemoryProvider _dbp;

  MemoryRepository() {
    _dbp = MemoryProvider.instance;
  }

  @override
  Future<bool> delete(int id) async {
    try {
      Flower f = await getById(id);
      List<Flower> db = await _dbp.database;
      db.remove(f);
      return true;
    } catch (err) {
      return false;
    }
  }

  @override
  Future<Flower> getById(int id) async {
    List<Flower> list = await getAll();
    int i = 0;
    bool found = false;
    while (i < list.length && !found) {
      if (list[i].id == id) {
        found = true;
      } else {
        i++;
      }
    }
    if (found) {
      return list[i];
    } else {
      throw NullThrownError();
    }
  }

  @override
  Future<int> insert(Flower f) async {
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
  Future<List<Flower>> getAll() async {
    return await _dbp.database;
  }
}
