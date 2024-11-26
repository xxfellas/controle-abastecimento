import 'package:flutter/material.dart';
import '../../services/database_service.dart';
import '../../models/vehicle.dart';

class VehicleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meus Veículos')),
      body: StreamBuilder<List<Vehicle>>(
        stream: DatabaseService().getVehicles(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Carregando dados
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar veículos: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum veículo cadastrado.'));
          }

          List<Vehicle> vehicles = snapshot.data!;
          return ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              Vehicle vehicle = vehicles[index];
              return ListTile(
                title: Text(vehicle.name),
                subtitle: Text('${vehicle.model} - ${vehicle.year}'),
                onTap: () {
                  // Redirecionar para detalhes do veículo
                },
              );
            },
          );
        },
      ),
    );
  }
}
