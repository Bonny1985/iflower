import 'package:flutter/material.dart';
import 'package:iflower/Screens/InsertScreen.dart';
import 'package:iflower/Screens/SearchScreen.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    // stile dei pulsanti
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    Widget btnInsert = ElevatedButton(
        style: style,
        child: const Text('AGGIUNGI FIORE'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InsertScreen()),
          );
        }
    );

    Widget btnSearch = ElevatedButton(
        style: style, 
        child: const Text('CERCA FIORE'), 
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        }
    );

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("iFlower App")
            ),
            body: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    btnInsert,
                    const SizedBox(height: 30), // spazio tra i pulsanti
                    btnSearch
                  ],
                ),
              ],
            )));
  }
}
/*

                        setState(() {
                          counter++;
                        });

                        Flower f = Flower(
                            color: FlowerColor.RED,
                            name: "Name $counter",
                            description: "Descr $counter",
                            size: FlowerSize.MEDIUM
                        );

                        _repository.insert(f);
*/
