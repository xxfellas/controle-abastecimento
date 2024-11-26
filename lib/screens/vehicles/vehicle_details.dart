import 'package:flutter/material.dart';
import '../../models/refueling.dart';
import '../../models/vehicle.dart';
import '../../services/database_service.dart';

class VehicleDetailsPage extends StatelessWidget {
  final Vehicle vehicle;

  VehicleDetailsPage({required this.vehicle});

  double calculateAverageConsumption(List<Refueling> refuelings) {
    if (refuelings.length < 2) return 0;

    refuelings.sort((a, b) => a.date.compareTo(b.date));
    double totalDistance = refuelings.last.currentMileage - refuelings.first.currentMileage;
    double totalLiters = refuelings.fold(0, (sum, ref) => sum + ref.liters);

    return totalDistance / totalLiters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(vehicle.name)),
      body: StreamBuilder<List<Refueling>>(
        stream: DatabaseService().getRefuelings(vehicle.id),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<Refueling> refuelings = snapshot.data!;
          double averageConsumption = calculateAverageConsumption(refuelings);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Modelo: ${vehicle.model}', style: TextStyle(fontSize: 18)),
                Text('Ano: ${vehicle.year}', style: TextStyle(fontSize: 18)),
                Text('Placa: ${vehicle.plate}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 20),
                Text('Média de Consumo: ${averageConsumption.toStringAsFixed(2)} Km/L',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        },
      ),
    );
  }
}
