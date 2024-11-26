import 'package:flutter/material.dart';
import '../../models/refueling.dart';
import '../../services/database_service.dart';

class AddRefuelingPage extends StatelessWidget {
  final String vehicleId;
  final TextEditingController litersController = TextEditingController();
  final TextEditingController mileageController = TextEditingController();

  AddRefuelingPage({required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo Abastecimento')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: litersController,
              decoration: InputDecoration(labelText: 'Litros abastecidos'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: mileageController,
              decoration: InputDecoration(labelText: 'Quilometragem atual'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Refueling refueling = Refueling(
                  id: DateTime.now().toString(),
                  vehicleId: vehicleId,
                  liters: double.parse(litersController.text),
                  currentMileage: double.parse(mileageController.text),
                  date: DateTime.now(),
                );
                await DatabaseService().addRefueling(refueling);
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
