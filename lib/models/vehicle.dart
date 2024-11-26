class Vehicle {
  String id;
  String name;
  String model;
  int year;
  String plate;

  Vehicle({
    required this.id,
    required this.name,
    required this.model,
    required this.year,
    required this.plate,
  });

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      model: map['model'] ?? '',
      year: map['year'] ?? 0,
      plate: map['plate'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'model': model,
      'year': year,
      'plate': plate,
    };
  }
}