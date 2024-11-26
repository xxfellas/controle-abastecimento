import 'package:flutter/material.dart';
import '../../models/refueling.dart';
import '../../services/database_service.dart';

class VehicleHistoryPage extends StatelessWidget {
  final String vehicleId;

  VehicleHistoryPage({required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Histórico de Abastecimentos')),
      body: StreamBuilder<List<Refueling>>(
        stream: DatabaseService().getRefuelings(vehicleId),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<Refueling> refuelings = snapshot.data!;
          if (refuelings.isEmpty) {
            return Center(child: Text('Nenhum abastecimento registrado.'));
          }

          return ListView.builder(
            itemCount: refuelings.length,
            itemBuilder: (context, index) {
              Refueling refueling = refuelings[index];
              return ListTile(
                title: Text('${refueling.liters} L - ${refueling.date.toLocal()}'),
                subtitle: Text('Quilometragem: ${refueling.currentMileage}'),
              );
            },
          );
        },
      ),
    );
  }
}
