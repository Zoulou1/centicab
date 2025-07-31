import 'package:flutter/material.dart';
import '../services/ride_service.dart'; // Make sure this path is correct

class DriverDashboardScreen extends StatelessWidget {
  const DriverDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final rideRequests = RideService().getRideRequests();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ride Requests"),
        backgroundColor: Colors.deepPurple,
      ),
      body: rideRequests.isEmpty
          ? const Center(child: Text("No ride requests yet"))
          : ListView.builder(
              itemCount: rideRequests.length,
              itemBuilder: (context, index) {
                final request = rideRequests[index];
                return Card(
                  margin: const EdgeInsets.all(12),
                  child: ListTile(
                    leading: const Icon(Icons.directions_car, color: Colors.deepPurple),
                    title: Text("Pickup: ${request['pickup']}"),
                    subtitle: Text("Drop-off: ${request['dropoff']}"),
                    trailing: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Ride ${index + 1} accepted")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text("Accept"),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
