import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/vehicle.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addVehicle(Vehicle vehicle) async {
    try {
      await _firestore.collection('vehicles').doc(vehicle.id).set(vehicle.toMap());
    } catch (e) {
      print('Erro ao adicionar veículo: $e');
    }
  }

  Stream<List<Vehicle>> getVehicles() {
    return _firestore.collection('vehicles').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Vehicle.fromMap(doc.data())).toList();
    });
  }
}
