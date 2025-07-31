import 'package:flutter/material.dart';

class TaxiRequestScreen extends StatefulWidget {
  const TaxiRequestScreen({super.key});

  @override
  State<TaxiRequestScreen> createState() => _TaxiRequestScreenState();
}

class _TaxiRequestScreenState extends State<TaxiRequestScreen> {
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

    // TODO: Send request to backend
    print('Requesting taxi from "$pickup" to "$dropoff"...');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Taxi requested from "$pickup" to "$dropoff"')),
    );

    _pickupController.clear();
    _dropoffController.clear();
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
