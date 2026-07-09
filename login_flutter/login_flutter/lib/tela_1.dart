import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final TextEditingController emailController = TextEditingController();
  String mensagem = "";
  Color corCampo = Colors.blue.shade50;

  bool emailValido(String email) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bem-vindo",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Digite seu email",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                color: corCampo,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                String texto = emailController.text;
                if (emailValido(texto)) {
                  setState(() {
                    mensagem = "Login realizado com sucesso";
                    corCampo = Colors.blue.shade50;
                  });
                } else {
                  setState(() {
                    mensagem = "email invalido";
                    corCampo = Colors.red.shade50;
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Entrar",
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Text(
              mensagem,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
