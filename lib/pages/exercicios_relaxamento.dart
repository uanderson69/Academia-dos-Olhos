import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExerciciosRelaxamentoPage extends StatefulWidget {
  static const String routeName = '/exercicios_relaxamento';

  @override
  _ExerciciosRelaxamentoPageState createState() =>
      _ExerciciosRelaxamentoPageState();
}

class _ExerciciosRelaxamentoPageState extends State<ExerciciosRelaxamentoPage> {
  int _backgroundImageIndex = 0;

  List<String> _backgroundImages = [
    'assets/images/relaxamento1.png',
    'assets/images/relaxamento2.png',
    'assets/images/relaxamento3.png',
    'assets/images/relaxamento4.png',
    'assets/images/relaxamento5.png',
    'assets/images/relaxamento6.png',
    'assets/images/relaxamento7.png',
    'assets/images/relaxamento8.png',
    'assets/images/relaxamento9.png',
  ];

  @override
  void initState() {
    super.initState();
    _startExercicios(); // Iniciar exercícios automaticamente ao abrir a tela
  }

  void _proximoExercicio() {
    if (_backgroundImageIndex < _backgroundImages.length - 1) {
      setState(() {
        _backgroundImageIndex++;
      });
    } else {
      setState(() {
        _backgroundImageIndex = 0; // Reinicie para a primeira imagem
      });
      Navigator.of(context).pushReplacementNamed(
          '/tela-inicial2'); // Redirecione para a página inicial 2
    }
  }

  void _startExercicios() {
    setState(() {
      _backgroundImageIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Relaxamento"),
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
                GestureDetector(
                  onTap: _proximoExercicio,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    child: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: Color(0xFF9AD0D3),
                      size: 35,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
