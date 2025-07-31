import 'package:flutter/material.dart';
import '../services/ride_service.dart'; // Ensure the path is correct

class RequestTaxiScreen extends StatefulWidget {
  const RequestTaxiScreen({super.key});

  @override
  State<RequestTaxiScreen> createState() => _RequestTaxiScreenState();
}

class _RequestTaxiScreenState extends State<RequestTaxiScreen> {
  final _pickupController = TextEditingController();
  final _dropoffController = TextEditingController();

  void _submitRequest() {
    final pickup = _pickupController.text.trim();
    final dropoff = _dropoffController.text.trim();

    if (pickup.isEmpty || dropoff.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both pickup and drop-off locations')),
      );
      return;
    }

    // ✅ Save request using RideService
    RideService().addRide(pickup, dropoff);

    // ✅ Show confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Taxi requested from "$pickup" to "$dropoff"')),
    );

    // ✅ Clear fields
    _pickupController.clear();
    _dropoffController.clear();

    // ✅ Navigate to home after a short delay
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Request a Taxi"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _pickupController,
              decoration: const InputDecoration(labelText: 'Pickup Location'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _dropoffController,
              decoration: const InputDecoration(labelText: 'Drop-off Location'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _submitRequest,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Request Taxi"),
            ),
          ],
        ),
      ),
    );
  }
}
