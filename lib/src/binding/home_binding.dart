import 'package:boozin_fitness/src/controller/helth_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelthRepository());
  }
}
