import 'package:flutter/material.dart';
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
            ElevatedButton(
              onPressed: () {
                // Lógica para editar o veículo
              },
              child: Text('Editar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Lógica para excluir o veículo
              },
              child: Text('Excluir'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
