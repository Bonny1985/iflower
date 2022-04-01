import 'package:flutter/material.dart';
import 'package:iflower/Screens/InsertScreen.dart';
import 'package:iflower/Screens/SearchScreen.dart';

/// Schermata principale
class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    // stile comune dei pulsanti
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    // pulsante per inserimento
    ElevatedButton btnInsert = ElevatedButton(
        style: style,
        child: const Text('AGGIUNGI FIORE'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InsertScreen()),
          );
        }
    );

    // pulsante per ricerca
    ElevatedButton btnSearch = ElevatedButton(
        style: style, 
        child: const Text('CERCA FIORE'), 
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        }
    );

    // colonna per renderizzare i pulsanti in serie
    Column col = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        btnInsert,
        const SizedBox(height: 30), // spazio tra i pulsanti
        btnSearch
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
