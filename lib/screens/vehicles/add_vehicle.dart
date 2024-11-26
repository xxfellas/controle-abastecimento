import 'package:flutter/material.dart';
import '../../models/vehicle.dart';
import '../../services/database_service.dart';

class AddVehiclePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController plateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Veículo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: modelController,
              decoration: InputDecoration(labelText: 'Modelo'),
            ),
            TextField(
              controller: yearController,
              decoration: InputDecoration(labelText: 'Ano'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: plateController,
              decoration: InputDecoration(labelText: 'Placa'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Vehicle vehicle = Vehicle(
                  id: DateTime.now().toString(),
                  name: nameController.text,
                  model: modelController.text,
                  year: int.parse(yearController.text),
                  plate: plateController.text,
                );
                await DatabaseService().addVehicle(vehicle);
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
