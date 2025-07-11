import 'package:flutter/material.dart';
import 'package:pixel_home01/CustomDrawer.dart';
import 'package:pixel_home01/ARViewScreen.dart';

class PaginaPrincipal extends StatelessWidget {
  PaginaPrincipal({Key? key}) : super(key: key);

  bool showAR = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pagina Principal'),),
        drawer: CustomDrawer(),
        body: ARViewScreen(),
    );
  }

}
