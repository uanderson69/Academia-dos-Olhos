import 'package:bic_ofic/pages/rotinas.dart';
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
                    Navigator.pushNamed(context, '/editar_perfil');
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(240, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                    primary: Color.fromARGB(255, 150, 145, 145), // Rosa pastel
                  ),
                  icon: Icon(Icons.edit), // Ícone de lápis
                  label: Text("Editar perfil"),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ExerciciosRelaxamentoPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(240, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                    primary: Color(0xFFA2E4D6), // Verde pastel
                  ),
                  icon: Icon(Icons.local_hotel), // Ícone de hotel
                  label: Text("Relaxamento"),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, ExercicioPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(240, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                    primary: Color(0xFFA4C2F4), // Azul pastel
                  ),
                  icon: Icon(Icons.fitness_center), // Ícone de academia
                  label: Text("Fortalecimento"),
                ),
                SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, RotinasPage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(240, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    textStyle: TextStyle(fontSize: 18),
                    primary: Color(0xFFD1A4F4), // Lilás pastel
                  ),
                  icon: Icon(Icons.calendar_today), // Ícone de calendário
                  label: Text("Rotina"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
