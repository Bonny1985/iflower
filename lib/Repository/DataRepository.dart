

import '../Models/Flower.dart';

abstract class DataRepository {
  /// Torna il fiore corrispondente al identificativo univoco ID
  Future<Flower> getById(int id);

  /// Inserisce un nuovo fiore
  Future<int> insert(Flower f);

  /// Elimina un fiore mediante identificativo univoco ID
  Future<bool> delete(int id);

  /// Modifica un fiore
  Future<bool> put(Flower f);

  /// Cerca dei fiori mediante i parametri di ricerca valorizzati
  Future<List<Flower>> search(FlowerColor? color, FlowerSize? size);

  Future<List<Flower>> getAll();
}
