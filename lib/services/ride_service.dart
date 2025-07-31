class RideService {
  // Singleton setup
  static final RideService _instance = RideService._internal();
  factory RideService() => _instance;
  RideService._internal();

  final List<Map<String, String>> _rideRequests = [];

  // Add a new ride request
  void addRide(String pickup, String dropoff) {
    _rideRequests.add({
      "pickup": pickup,
      "dropoff": dropoff,
    });
  }

  // Get all ride requests
  List<Map<String, String>> getRideRequests() {
    return List<Map<String, String>>.from(_rideRequests);
  }

  // Optional: clear all requests (for resetting/testing)
  void clear() {
    _rideRequests.clear();
  }
}
