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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Novo Abastecimento',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preencha os detalhes do abastecimento:',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: litersController,
              decoration: InputDecoration(
                labelText: 'Litros abastecidos',
                labelStyle: TextStyle(color: Colors.grey[400]),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[900],
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            TextField(
              controller: mileageController,
              decoration: InputDecoration(
                labelText: 'Quilometragem atual',
                labelStyle: TextStyle(color: Colors.grey[400]),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: Colors.grey[900],
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    Refueling refueling = Refueling(
                      id: DateTime.now().toString(),
                      vehicleId: vehicleId,
                      liters: double.parse(litersController.text),
                      currentMileage: double.parse(mileageController.text),
                      date: DateTime.now(),
                    );

                    await DatabaseService().addRefueling(refueling);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Abastecimento adicionado com sucesso!')),
                    );
                    Navigator.pop(context);
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Erro ao adicionar abastecimento: $e')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF820AD1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Salvar',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
