import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OlhoDominantePage extends StatefulWidget {
  static const routeName = '/olho_dominante';

  @override
  _OlhoDominantePageState createState() => _OlhoDominantePageState();
}

class _OlhoDominantePageState extends State<OlhoDominantePage> {
  int _backgroundImageIndex = 0;

  List<String> _backgroundImages = [
    'assets/images/olho_dominante1.png',
    'assets/images/olho_dominante2.png',
  ];

  void _proximoExercicio(bool avancar) {
    setState(() {
      if (avancar) {
        if (_backgroundImageIndex < _backgroundImages.length - 1) {
          _backgroundImageIndex++;
        } else {
          _backgroundImageIndex = 0; // Reinicie para a primeira imagem
        }
      } else {
        if (_backgroundImageIndex > 0) {
          _backgroundImageIndex--;
        } else {
          _backgroundImageIndex =
              _backgroundImages.length - 1; // Volte para a última imagem
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Olho Dominante"),
        backgroundColor: Color(0xFFEDBEA4),
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(_backgroundImages[_backgroundImageIndex]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 400),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _proximoExercicio(false),
                      child: Icon(
                        FontAwesomeIcons
                            .arrowLeft, // Ícone de seta para a esquerda
                        color: Color(0xFF9AD0D3),
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 20),
                    GestureDetector(
                      onTap: () => _proximoExercicio(true),
                      child: Icon(
                        FontAwesomeIcons
                            .arrowRight, // Ícone de seta para a direita
                        color: Color(0xFF9AD0D3),
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
