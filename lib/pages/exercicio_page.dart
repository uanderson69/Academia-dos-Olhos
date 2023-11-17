import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ExercicioPage extends StatefulWidget {
  static const routeName = '/exercicio';

  @override
  _ExercicioPageState createState() => _ExercicioPageState();
}

class _ExercicioPageState extends State<ExercicioPage> {
  int _backgroundImageIndex = 0;

  List<String> _backgroundImages = [
    'assets/images/tela_de_ex.png',
    'assets/images/tela_de_ex2.png',
    'assets/images/tela_de_ex3.png',
    'assets/images/tela_de_ex4.png',
    'assets/images/tela_de_ex5.png',
    'assets/images/tela_de_ex6.png',
    'assets/images/tela_de_ex7.png',
    'assets/images/tela_final_de_ex.png',
  ];

  Timer? _timer;
  int _secondsRemaining = 60;

  @override
  void initState() {
    super.initState();
    _startExercicios(); // Iniciar exercícios automaticamente ao abrir a tela
  }

  void _proximoExercicio() {
    if (_backgroundImageIndex < _backgroundImages.length - 1) {
      setState(() {
        _backgroundImageIndex++;
        _resetTimer();
      });
    } else {
      setState(() {
        _backgroundImageIndex = 0; // Reinicie para a primeira imagem
      });
      Navigator.of(context).pushReplacementNamed('/');
    }
  }

  void _startExercicios() {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _proximoExercicio();
      }
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _secondsRemaining = 60;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Exercício"),
        backgroundColor: Color(0xFFA4C2F4),
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
          Positioned(
            top: 435,
            right: 10,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border:
                    Border.all(color: Color.fromARGB(255, 0, 0, 0), width: 2),
              ),
              child: Center(
                child: Text(
                  '$_secondsRemaining',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
