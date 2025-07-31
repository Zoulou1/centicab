import 'package:flutter/material.dart';
import 'passenger_login_screen.dart';
import 'passenger_register_screen.dart';
import 'driver_login_screen.dart';
import 'driver_register_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to CentiCab',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PassengerLoginScreen()),
                  );
                },
                child: const Text("Passenger Login"),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PassengerRegisterScreen()),
                  );
                },
                child: const Text("Passenger Register"),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DriverLoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                child: const Text("Driver Login"),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DriverRegisterScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
                child: const Text("Driver Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
