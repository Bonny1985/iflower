
import 'package:flutter/material.dart';
import 'package:iflower/Models/Flower.dart';
import 'package:iflower/Repository/DataRepository.dart';
import 'package:iflower/Repository/MemoryRepository.dart';


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
    _repository = MemoryRepository();
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
            body: TextButton(
              onPressed: () async {

                setState(() {
                  counter++;
                });

                Flower f = Flower(
                    color: FlowerColor.RED,
                    name: "Name $counter",
                    description: "Descr $counter",
                    size: FlowerSize.MEDIUM);

                    await _repository.insert(f);

                

              },
              child: Text("INSERT $counter"),
            )));
  }
}
