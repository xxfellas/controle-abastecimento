import 'package:flutter/material.dart';
import 'add_refueling.dart';
import 'history_page.dart'; // Importe a nova tela
import '../../models/vehicle.dart';

class VehicleDetailsPage extends StatelessWidget {
  final Vehicle vehicle;

  VehicleDetailsPage({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          vehicle.name,
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
              'Detalhes do Veículo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            Card(
              color: Colors.grey[900],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Modelo: ${vehicle.model}', style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(height: 10),
                    Text('Ano: ${vehicle.year}', style: TextStyle(fontSize: 16, color: Colors.white)),
                    SizedBox(height: 10),
                    Text('Placa: ${vehicle.plate}', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Botão para Adicionar Abastecimento
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddRefuelingPage(vehicleId: vehicle.id)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF820AD1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              icon: Icon(Icons.add, color: Colors.white),
              label: Text(
                'Adicionar Abastecimento',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            // Botão para Histórico de Abastecimento
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage(vehicleId: vehicle.id)),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF820AD1),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              icon: Icon(Icons.history, color: Colors.white),
              label: Text(
                'Ver Histórico',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
