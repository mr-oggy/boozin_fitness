import 'package:health/health.dart';

class HelthService {
  static HealthFactory health = HealthFactory();

  static Future<List<HealthDataPoint>> fetchHealthData() async {
    /// Give a HealthDataType with the given identifier
    final types = [
      HealthDataType.STEPS,
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ];

    /// Give a permissions for the given HealthDataTypes
    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];

    /// current time
    final now = DateTime.now();

    /// Give a yesterday's time
    final yesterday = now.subtract(const Duration(days: 1));

    /// to store HealthDataPoint
    List<HealthDataPoint> healthData = [];

    /// request google Authorization when the app is opened for the first time
    bool requested = await health.requestAuthorization(types, permissions: permissions);

    ///check if the request is successful
    if (requested) {
      /// fetch the data from the health store
      healthData = await health.getHealthDataFromTypes(yesterday, now, types);

    } else {
      /// if the request is not successful
      throw AuthenticationRequired();
    }
    return healthData;
  }
}

class AuthenticationRequired extends Error {}
