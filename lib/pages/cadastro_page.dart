import 'package:bic_ofic/pages/olho_dominante_page.dart';
import 'package:bic_ofic/pages/tela_inicial2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart'; // Importe o pacote Fluttertoast

class CadastroPage extends StatelessWidget {
  static const String routeName = '/cadastro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro"),
        backgroundColor: Color(0xFFEDBEA4),
      ),
      body: CadastroForm(),
    );
  }
}

class CadastroForm extends StatefulWidget {
  @override
  _CadastroFormState createState() => _CadastroFormState();
}

class _CadastroFormState extends State<CadastroForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _usaOculos = 'Nao';
  final TextEditingController _grauOculosController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final nome = _nameController.text;
      final email = _emailController.text;
      final senha = _passwordController.text;
      final usaOculos = _usaOculos;
      final grauOculos = _grauOculosController.text;

      final data = {
        'nome': nome,
        'email': email,
        'senha': senha,
        'usa_oculos': usaOculos,
        'grau_oculos': grauOculos,
      };

      final response = await http.post(
        Uri.parse('http://localhost/api/cadastro.php'), // Atualize a URL da API
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['success']) {
          Fluttertoast.showToast(
            msg: "Cadastro bem sucedido",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );

          // Após exibir o pop-up, ir para a tela inicial 2
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => TelaInicial2()));
        } else {
          // Trate um cadastro malsucedido, exibindo uma mensagem de erro, por exemplo.
          Fluttertoast.showToast(
            msg: "Erro no cadastro: ${responseData['message']}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      } else {
        // Lidar com erros de conexão ou outros erros aqui
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Adicione SingleChildScrollView aqui
      child: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF63768d),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Color(0xFF63768d),
                    ),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF63768d),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Color(0xFF63768d),
                    ),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF63768d),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Color(0xFF63768d),
                    ),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma senha';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                Text("Você usa óculos"),
                Row(
                  children: [
                    Radio(
                      value: 'Sim',
                      groupValue: _usaOculos,
                      onChanged: (value) {
                        setState(() {
                          _usaOculos = value.toString();
                        });
                      },
                      activeColor: Color.fromARGB(255, 2, 103, 185),
                    ),
                    Text("Sim"),
                    Radio(
                      value: 'Nao',
                      groupValue: _usaOculos,
                      onChanged: (value) {
                        setState(() {
                          _usaOculos = value.toString();
                        });
                      },
                      activeColor: Color.fromARGB(255, 2, 103, 185),
                    ),
                    Text("Não"),
                  ],
                ),
                TextFormField(
                  controller: _grauOculosController,
                  decoration: InputDecoration(
                    labelText: "Grau dos óculos",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xFF63768d),
                      ),
                    ),
                    labelStyle: TextStyle(
                      color: Color(0xFF63768d),
                    ),
                    prefixIcon: Icon(Icons.remove_red_eye),
                  ),
                  validator: (value) {
                    if (_usaOculos == 'Sim' &&
                        (value == null || value.isEmpty)) {
                      return 'Por favor, insira o grau dos óculos';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, OlhoDominantePage.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF9AD0D3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Olho dominante"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFEDBEA4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Cadastrar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
