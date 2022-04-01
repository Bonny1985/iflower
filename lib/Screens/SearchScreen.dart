import 'package:flutter/material.dart';
import 'package:iflower/Repository/DataRepository.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({ Key? key }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  DataRepository? _db;

  @override
  void initState() {
    super.initState();
    _db = DataRepository.build();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(title: const Text("Cerca Fiore")),
    );
  }
}