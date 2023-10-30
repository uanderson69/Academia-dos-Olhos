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
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ExerciciosRelaxamentoPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9AD0D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("Relaxamento"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ExercicioPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9AD0D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text("Fortalecimento"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
