import 'package:bic_ofic/pages/tela_inicial2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditarPerfilPage extends StatefulWidget {
  static const String routeName = '/editar_perfil';

  final int userId; // Adicione uma variável para armazenar o ID do usuário

  EditarPerfilPage(
      {required this.userId}); // Construtor que recebe o ID do usuário

  @override
  _EditarPerfilPageState createState() => _EditarPerfilPageState();
}

class _EditarPerfilPageState extends State<EditarPerfilPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController(); // Adicione um controlador para a senha

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Editar Perfil"), backgroundColor: Color(0xFFB0C4DE)),
      body: EditarPerfilForm(
          userId: widget.userId), // Passe o ID do usuário para o formulário
    );
  }
}

class EditarPerfilForm extends StatefulWidget {
  final int userId; // Receba o ID do usuário no construtor

  EditarPerfilForm(
      {required this.userId}); // Construtor que recebe o ID do usuário

  @override
  _EditarPerfilFormState createState() => _EditarPerfilFormState();
}

class _EditarPerfilFormState extends State<EditarPerfilForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  ),
                  // ...
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                  // ...
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: "Senha",
                  ),
                  // ...
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFB0C4DE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("Salvar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final userId = widget.userId;
      final nome = _nameController.text;
      final email = _emailController.text;
      final senha = _passwordController.text;

      final data = {
        'id': userId, // Envie o ID do usuário
        'nome': nome,
        'email': email,
        'senha': senha,
      };

      final response = await http.post(
        Uri.parse(
            'http://localhost/api/atualizar_perfil.php'), // Atualize a URL da API
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        if (responseData['success']) {
          Fluttertoast.showToast(
            msg: "Alteração bem sucedida",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.green,
            textColor: Colors.white,
          );

          // Após exibir o pop-up, ir para a tela incial 2
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => TelaInicial2()));
        } else {
          // Trate um login malsucedido, exibindo uma mensagem de erro, por exemplo.
          Fluttertoast.showToast(
            msg: "Erro no login: ${responseData['message']}",
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
  // ...
}
