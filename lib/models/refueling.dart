class Refueling {
  String id;
  String vehicleId; // ID do veículo associado
  double liters;
  double currentMileage;
  DateTime date;

  Refueling({
    required this.id,
    required this.vehicleId,
    required this.liters,
    required this.currentMileage,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'vehicleId': vehicleId,
      'liters': liters,
      'currentMileage': currentMileage,
      'date': date.toIso8601String(),
    };
  }

  static Refueling fromMap(Map<String, dynamic> map) {
    return Refueling(
      id: map['id'],
      vehicleId: map['vehicleId'],
      liters: map['liters'],
      currentMileage: map['currentMileage'],
      date: DateTime.parse(map['date']),
    );
  }
}
