import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();

  String mensagem = "";
  bool sucesso = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.person,
                size: 80,
                color: Colors.blue,
              ),
              const SizedBox(height: 20),
              const Text(
                "Criar Conta",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: nomeController,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  hintText: "Digite seu nome",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Digite seu email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  hintText: "Digite sua senha",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: confirmarSenhaController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirmar senha",
                  hintText: "Repita sua senha",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock_outline),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                mensagem,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  String nome = nomeController.text;
                  String email = emailController.text;
                  String senha = senhaController.text;
                  String confirmar = confirmarSenhaController.text;

                  if (nome.isEmpty) {
                    setState(() {
                      mensagem = "Digite seu nome";
                      sucesso = false;
                    });
                  } else if (email.isEmpty) {
                    setState(() {
                      mensagem = "Digite seu email";
                      sucesso = false;
                    });
                  } else if (!email.contains("@")) {
                    setState(() {
                      mensagem = "Digite um email válido";
                      sucesso = false;
                    });
                  } else if (senha.isEmpty) {
                    setState(() {
                      mensagem = "Digite sua senha";
                      sucesso = false;
                    });
                  } else if (senha.length < 6) {
                    setState(() {
                      mensagem = "A senha precisa ter pelo menos 6 caracteres";
                      sucesso = false;
                    });
                  } else if (confirmar != senha) {
                    setState(() {
                      mensagem = "As senhas não são iguais";
                      sucesso = false;
                    });
                  } else {
                    setState(() {
                      mensagem = "Cadastro realizado com sucesso!";
                      sucesso = true;
                    });
                  }
                },
                icon: const Icon(Icons.check),
                label: const Text("Cadastrar"),
              ),
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text("Voltar para Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}