

import 'package:iflower/Models/Flower.dart';

class MemoryProvider {
  MemoryProvider._();
  static final MemoryProvider instance = MemoryProvider._();

  final List<Flower> _database = [];

  Future<List<Flower>> get database async {
    return _database;
  }
}
