import 'package:bic_ofic/pages/exercicio_page.dart';
import 'package:bic_ofic/pages/exercicios_relaxamento.dart';
import 'package:bic_ofic/pages/olho_dominante_page.dart';
import 'package:bic_ofic/pages/tela_inicial2.dart';
import 'package:flutter/material.dart';
import 'package:bic_ofic/pages/cadastro_page.dart';
import 'package:bic_ofic/pages/login_page.dart';

void main() {
  runApp(ExerciciosApp());
}

class ExerciciosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = false; // Verifique se o usuário está logado

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF9AD0D3),
        accentColor: Color.fromARGB(255, 255, 255, 255),
        fontFamily: 'Aerial',
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => HomePage(isUserLoggedIn: isUserLoggedIn),
        CadastroPage.routeName: (ctx) => CadastroPage(),
        LoginPage.routeName: (ctx) => LoginPage(),
        ExercicioPage.routeName: (ctx) => ExercicioPage(),
        ExerciciosRelaxamentoPage.routeName: (ctx) =>
            ExerciciosRelaxamentoPage(),
        OlhoDominantePage.routeName: (context) => OlhoDominantePage(),
        TelaInicial2.routeName: (ctx) => TelaInicial2(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isUserLoggedIn;

  HomePage({required this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(255, 255, 255, 0.6),
            child: Image.asset(
              'assets/images/tela inicial.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 270),
                // Verifique se o usuário está logado antes de exibir os botões
                if (!isUserLoggedIn)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CadastroPage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9AD0D3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text("Cadastro"),
                  ),
                SizedBox(height: 10),
                // Verifique se o usuário está logado antes de exibir os botões
                if (!isUserLoggedIn)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginPage.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9AD0D3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      textStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text("Login"),
                  ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
