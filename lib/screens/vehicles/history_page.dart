import 'package:flutter/material.dart';
import '../../models/refueling.dart';
import '../../services/database_service.dart';

class HistoryPage extends StatelessWidget {
  final String vehicleId;

  HistoryPage({required this.vehicleId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Histórico de Abastecimentos',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<List<Refueling>>(
          stream: DatabaseService().getRefuelings(vehicleId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(color: Colors.white));
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Erro ao carregar o histórico: ${snapshot.error}',
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(
                child: Text(
                  'Nenhum abastecimento registrado.',
                  style: TextStyle(color: Colors.grey[400], fontSize: 16),
                ),
              );
            }

            List<Refueling> refuelings = snapshot.data!;
            return ListView.builder(
              itemCount: refuelings.length,
              itemBuilder: (context, index) {
                Refueling refueling = refuelings[index];
                return Card(
                  color: Colors.grey[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Text(
                      '${refueling.liters.toStringAsFixed(2)} litros - ${refueling.date.toLocal()}',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    subtitle: Text(
                      'Quilometragem: ${refueling.currentMileage}',
                      style: TextStyle(color: Colors.grey[400], fontSize: 14),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
