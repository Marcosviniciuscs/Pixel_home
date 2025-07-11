import 'package:circular_loading_button/loading_button_state.dart';
import 'package:flutter/material.dart';
import 'package:circular_loading_button/loading_button.dart';
import 'package:pixel_home01/PaginaPrincipal.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  LoadingButtonState _currentState = LoadingButtonState.idle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imagens/fundo.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Pixel Home',
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 50, top: 30, right: 50, bottom: 150),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 32),
                LoadingButton(
                  type: LoadingButtonType.elevated,
                  state: _currentState,
                  //async : é usado para marcar uma função como assíncrona, ou seja, uma função que pode pausar sua execução enquanto espera por algo
                  onPressed: () async {
                    setState(() => _currentState = LoadingButtonState.loading);
                    await Future.delayed(
                      const Duration(seconds: 1,milliseconds: 5),
                          () => setState(() => _currentState = LoadingButtonState.idle),
                    );
                    // Após o "carregamento", navegar para a próxima página
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context){
                            return PaginaPrincipal();
                          })
                    );
                  },
                  child: Text(
                    'Começar',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}