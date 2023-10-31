import 'package:flutter/material.dart';
import 'package:bic_ofic/utils/rotas.dart';

import 'exercicio_page.dart';
import 'exercicios_relaxamento.dart';

class TelaInicial2 extends StatelessWidget {
  static const String routeName = '/tela_inicial2';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(255, 255, 255, 0.6),
            child: Image.asset(
              'assets/images/tela inicial2.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ExerciciosRelaxamentoPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                    primary: Color.fromARGB(255, 241, 167, 127), // Cor de fundo
                  ),
                  icon: Icon(Icons.local_hotel),
                  label: Text("Relaxamento"),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, ExercicioPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                    primary: Color.fromARGB(255, 200, 245, 163), // Cor de fundo
                  ),
                  icon: Icon(Icons.fitness_center),
                  label: Text("Fortalecimento"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
