
import 'package:flutter/material.dart';
import 'package:iflower/Models/Flower.dart';
import 'package:iflower/Repository/DataRepository.dart';
import 'package:iflower/Repository/MemoryRepository.dart';
import 'package:iflower/Repository/SqlRepository.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;
  late DataRepository _repository;

  @override
  void initState() {
    super.initState();
    _repository = DataRepository.build();
  }

  @override
  Widget build(BuildContext context) {

   _repository.getAll().then((list) {
     print(list);
   });

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text("iFlower App"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {

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
                      },
                      child: Text("INSERT $counter"),
                    ),
                  ],
                ),
              ],
            )));
  }
}
