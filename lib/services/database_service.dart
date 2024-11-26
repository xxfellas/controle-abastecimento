import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/refueling.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Adiciona um abastecimento
  Future<void> addRefueling(Refueling refueling) async {
    try {
      await _firestore.collection('refuelings').doc(refueling.id).set(refueling.toMap());
    } catch (e) {
      print('Erro ao adicionar abastecimento: $e');
    }
  }

  // Obtém abastecimentos por veículo
  Stream<List<Refueling>> getRefuelings(String vehicleId) {
    return _firestore
        .collection('refuelings')
        .where('vehicleId', isEqualTo: vehicleId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Refueling.fromMap(doc.data())).toList();
    });
  }
}