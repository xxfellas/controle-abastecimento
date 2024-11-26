import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Drawer(
      child: Container(
        color: Colors.black, // Fundo preto
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho do Drawer
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF820AD1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      size: 40,
                      color:Color(0xFF820AD1),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    user?.email ?? 'Usuário',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Bem-vindo!',
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                ],
              ),
            ),

            // Itens do Drawer
            Expanded(
              child: ListView(
                children: [
                  _buildDrawerItem(
                    context,
                    icon: Icons.home,
                    title: 'Home',
                    onTap: () => Navigator.pushNamed(context, '/home'),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.directions_car,
                    title: 'Meus Veículos',
                    onTap: () => Navigator.pushNamed(context, '/vehicles'),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.add,
                    title: 'Adicionar Veículo',
                    onTap: () => Navigator.pushNamed(context, '/add_vehicle'),
                  ),
                  _buildDrawerItem(
                    context,
                    icon: Icons.person,
                    title: 'Perfil',
                    onTap: () => Navigator.pushNamed(context, '/profile'),
                  ),
                  Divider(color: Colors.grey), // Separador estilizado
                  _buildDrawerItem(
                    context,
                    icon: Icons.logout,
                    title: 'Sair',
                    onTap: () async {
                      await FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, {required IconData icon, required String title, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white), // Ícones brancos
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white), // Texto branco
      ),
      onTap: onTap,
    );
  }
}
