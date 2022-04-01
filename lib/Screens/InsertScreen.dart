import 'package:flutter/material.dart';
import 'package:iflower/Repository/DataRepository.dart';

class InsertScreen extends StatefulWidget {
  const InsertScreen({Key? key}) : super(key: key);

  @override
  State<InsertScreen> createState() => _InsertScreenState();
}

class _InsertScreenState extends State<InsertScreen> {

  DataRepository? _db;

  @override
  void initState() {
    super.initState();
    _db = DataRepository.build();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Nuovo Fiore")),
    );
  }
}
