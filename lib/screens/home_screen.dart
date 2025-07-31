import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String role; // "Passenger" or "Driver"

  const HomeScreen({super.key, this.role = "Passenger"});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        title: Text("Welcome, $role"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello, $role 👋🏾",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (role == "Passenger") {
                  Navigator.pushNamed(context, '/request-taxi');
                } else {
                  Navigator.pushNamed(context, '/driver-dashboard'); // ✅ Now navigates to driver dashboard
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
              ),
              child: Text(
                role == "Passenger" ? "Find a Ride" : "View Ride Requests",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
