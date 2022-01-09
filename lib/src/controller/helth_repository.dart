import 'package:boozin_fitness/src/services/health_services.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

class HelthRepository extends GetxController {
  var healthPoint = <HealthDataPoint>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHealthData();
  }

  void fetchHealthData() async {
    final healthData = await HelthService.fetchHealthData();
    healthPoint.assignAll(healthData);
    update();
  }
}
