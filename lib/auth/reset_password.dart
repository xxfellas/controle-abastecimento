import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ResetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recuperar Senha')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await AuthService().resetPassword(emailController.text);
                Navigator.pop(context);
              },
              child: Text('Enviar link de recuperação'),
            ),
          ],
        ),
      ),
    );
  }
}
