import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  
  final FlutterErrorDetails details;
  const ErrorScreen({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    String errorMsg = details.exception.toString();

    return MaterialApp(
      title: 'iFlower App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        // da modificare a piacere
        body: Text(errorMsg)
      ),
    );
  }
}
