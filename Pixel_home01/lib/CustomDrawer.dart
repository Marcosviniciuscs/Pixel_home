import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      //backgroundColor: Colors.blue,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          //cabeçalho
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueAccent,
             ),
            child:Text('Lista de Objetos',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
              subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // 1º item
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  //2º item
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  //3º item
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          //Segunda Linha
          ListTile(
            subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // 1º item
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  //2º item
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  //3º item
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          //3º Linha
          ListTile(
            subtitle: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // 1º item
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  //2º item
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  //3º item
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),

                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {

                      },
                      child: Image.asset(
                        'assets/imagens/cadeira01.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),

          //4º linha




          ///////////////
          
          
        ],
      ),
    );
  }
}
