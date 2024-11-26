import 'package:flutter/material.dart';
import 'add_refueling.dart';
import '../../models/vehicle.dart';

class VehicleDetailsPage extends StatelessWidget {
  final Vehicle vehicle;

  VehicleDetailsPage({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(vehicle.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Modelo: ${vehicle.model}', style: TextStyle(fontSize: 18)),
            Text('Ano: ${vehicle.year}', style: TextStyle(fontSize: 18)),
            Text('Placa: ${vehicle.plate}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text(
              'Clique no botão "+" abaixo para adicionar um abastecimento.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRefuelingPage(vehicleId: vehicle.id),
            ),
          );
        },
        child: Icon(Icons.add),
        tooltip: 'Adicionar Abastecimento',
      ),
    );
  }
}
