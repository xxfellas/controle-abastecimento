import 'package:flutter/material.dart';
import 'register.dart';
import '../services/auth_service.dart';
import '../auth/reset_password.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                try {
                  await AuthService().login(email, password);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Login realizado com sucesso!')),
                  );
                  Navigator.pushReplacementNamed(context, '/home'); // Redireciona para a HomePage
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Erro: ${e.toString()}')),
                  );
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text('Cadastre-se'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => ResetPasswordPage()),
                );
              },
              child: Text('Esqueceu sua senha?'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}
