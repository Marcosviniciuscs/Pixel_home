import 'package:flutter/material.dart';
import 'package:pixel_home01/HomePage.dart';
import 'package:ar_flutter_plugin_2/ar_flutter_plugin.dart';

void main() {
  //home : telaprincipal
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}



