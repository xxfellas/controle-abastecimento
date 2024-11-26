import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provaandreabastecimento/models/vehicle.dart';
import '../models/refueling.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addVehicle(Vehicle vehicle) async {
    try {
      await _firestore.collection('vehicles').doc(vehicle.id).set(vehicle.toMap());
      print('Veículo adicionado com sucesso: ${vehicle.toMap()}');
    } catch (e) {
      print('Erro ao adicionar veículo: $e');
    }
  }
  Future<void> updateVehicle(Vehicle vehicle) async {
    try {
      await _firestore.collection('vehicles').doc(vehicle.id).update(vehicle.toMap());
    } catch (e) {
      print('Erro ao atualizar veículo: $e');
    }
  }
  Stream<List<Vehicle>> getVehicles() {
    return _firestore.collection('vehicles').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Vehicle.fromMap({...data, 'id': doc.id}); // Certifique-se de que o ID seja incluído
      }).toList();
    });
  }
  Future<void> addRefueling(Refueling refueling) async {
    try {
      print('Tentando adicionar abastecimento: ${refueling.toMap()}'); // Debug
      await _firestore.collection('refuelings').doc(refueling.id).set(refueling.toMap());
      print('Abastecimento adicionado com sucesso!');
    } catch (e) {
      print('Erro ao adicionar abastecimento: $e');
      throw Exception('Erro ao adicionar abastecimento: $e');
    }
  }
  Stream<List<Refueling>> getRefuelings(String vehicleId) {
    return _firestore
        .collection('refuelings')
        .where('vehicleId', isEqualTo: vehicleId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Refueling.fromMap({...data, 'id': doc.id});
      }).toList();
    });
  }
}
