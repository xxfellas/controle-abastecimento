import 'package:flutter/material.dart';
import 'package:provaandreabastecimento/screens/vehicles/vehicle_details.dart';
import '../../services/database_service.dart';
import '../../models/vehicle.dart';

class VehicleListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meus Veículos')),
      body: StreamBuilder<List<Vehicle>>(
        stream: DatabaseService().getVehicles(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          List<Vehicle> vehicles = snapshot.data!;
          return ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              Vehicle vehicle = vehicles[index];
              return ListTile(
                title: Text(vehicle.name),
                subtitle: Text('${vehicle.model} - ${vehicle.year}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VehicleDetailsPage(vehicle: vehicle),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
