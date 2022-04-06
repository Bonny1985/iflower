import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iflower/Models/Flower.dart';
import 'package:iflower/Repository/DataRepository.dart';
import 'package:iflower/Screens/InsertScreen.dart';
import 'package:iflower/Screens/SearchScreen.dart';

/// Schermata principale
class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  /// funzione generica per il passaggio ad un'altra schermata
  /// dopo aver premuto un pulsante
  void _moveToScreen(BuildContext context, Widget screen) {
    MaterialPageRoute route = MaterialPageRoute(builder: (context) => screen);
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
   
    // stile comune dei pulsanti
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    // pulsante per inserimento
    ElevatedButton btnInsert = ElevatedButton(
        style: style,
        child: const Text('AGGIUNGI FIORE'),
        onPressed: () => _moveToScreen(context, const InsertScreen())
    );

    // pulsante per ricerca
    ElevatedButton btnSearch = ElevatedButton(
        style: style, 
        child: const Text('CERCA FIORE'), 
        onPressed: () => _moveToScreen(context, const SearchScreen())
    );

    ElevatedButton btnAdd = ElevatedButton(
        child: const Text('ADD'), 
        onPressed: () {
          String name = "Test flower ${DateTime.now().millisecondsSinceEpoch}";
          Flower newFlower = Flower(
            color: FlowerColor.values[Random().nextInt(FlowerColor.values.length)], 
            name: name, 
            description: "", 
            size: FlowerSize.values[Random().nextInt(FlowerSize.values.length)]
          );
          DataRepository.build().insert(newFlower);
        }
    );
    ElevatedButton btnDeleteAll = ElevatedButton(
        child: const Text('DEL ALL'), 
        onPressed: () async {
          DataRepository db = DataRepository.build();
          List<Flower> list = await db.getAll();
          for (var flower in list) {
            int? id = flower.id!;
            db.delete(id);
          }
        }
    );
    ElevatedButton btnPrintAll = ElevatedButton(
        child: const Text('PRINT ALL'), 
        onPressed: () async {
          DataRepository db = DataRepository.build();
          List<Flower> list = await db.getAll();
          for (var flower in list) {
            print(flower);
          }
        }
    );

    // colonna per renderizzare i pulsanti in serie
    Column col = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        btnInsert,
        const SizedBox(height: 20), // spazio tra i pulsanti
        btnSearch,
        const SizedBox(height: 30), 
        btnAdd,
        const SizedBox(height:  2), 
        btnPrintAll,
        const SizedBox(height: 2), 
        btnDeleteAll
      ],
    );

    // Riga per per allineare al centro dello schermo i pulsanti
    Row row = Row(
      mainAxisAlignment: MainAxisAlignment.center, 
      children: [col]
    );

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: const Text("iFlower App")),
            body: row
          )
    );


  }
}
