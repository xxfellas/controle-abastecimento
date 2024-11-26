import 'package:flutter/material.dart';
import '../../models/vehicle.dart';
import '../../services/database_service.dart';

class EditVehiclePage extends StatelessWidget {
  final Vehicle vehicle;

  final TextEditingController nameController;
  final TextEditingController modelController;
  final TextEditingController yearController;
  final TextEditingController plateController;

  EditVehiclePage({required this.vehicle})
      : nameController = TextEditingController(text: vehicle.name),
        modelController = TextEditingController(text: vehicle.model),
        yearController = TextEditingController(text: vehicle.year.toString()),
        plateController = TextEditingController(text: vehicle.plate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Editar Veículo')),
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
                vehicle.name = nameController.text;
                vehicle.model = modelController.text;
                vehicle.year = int.parse(yearController.text);
                vehicle.plate = plateController.text;

                await DatabaseService().updateVehicle(vehicle);
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
