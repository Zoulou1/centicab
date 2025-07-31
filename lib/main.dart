import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Auto-generated after `flutterfire configure`

// Screens
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/passenger_login_screen.dart';
import 'screens/passenger_register_screen.dart';
import 'screens/driver_login_screen.dart';
import 'screens/driver_register_screen.dart';
import 'screens/passenger_dashboard_screen.dart';
import 'screens/request_taxi_screen.dart';
import 'screens/driver_dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const CentiCabApp());
}

class CentiCabApp extends StatelessWidget {
  const CentiCabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CentiCab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/passenger-login': (context) => const PassengerLoginScreen(),
        '/passenger-register': (context) => const PassengerRegisterScreen(),
        '/driver-login': (context) => const DriverLoginScreen(),
        '/driver-register': (context) => const DriverRegisterScreen(),
        '/passenger-dashboard': (context) => const PassengerDashboardScreen(),
        '/request-taxi': (context) => const RequestTaxiScreen(),
        '/driver-dashboard': (context) => const DriverDashboardScreen(),
      },
    );
  }
}
