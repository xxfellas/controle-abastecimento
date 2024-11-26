import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provaandreabastecimento/screens/home.dart';
import 'package:provaandreabastecimento/screens/profile.dart';
import 'package:provaandreabastecimento/screens/vehicles/add_vehicle.dart';
import 'package:provaandreabastecimento/screens/vehicles/vehicle_list.dart';
import 'auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Abastecimento',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/vehicles': (context) => VehicleListPage(),
        '/add_vehicle': (context) => AddVehiclePage(),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
