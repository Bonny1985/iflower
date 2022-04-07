import 'package:flutter/material.dart';
import 'package:iflower/Screens/ErrorScreen.dart';
import 'package:iflower/Screens/HomeScreen.dart';


void main() {
  /// schermata generica in caso di errore
  ErrorWidget.builder = (FlutterErrorDetails details) {
     return ErrorScreen(details: details);
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iFlower App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeScreen(),
    );
  }
}
