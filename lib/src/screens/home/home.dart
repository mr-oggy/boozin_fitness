import 'package:boozin_fitness/src/controller/home_controller.dart';
import 'package:boozin_fitness/src/models/get_data_model.dart';
import 'package:boozin_fitness/src/utils/font_style.dart';
import 'package:boozin_fitness/src/utils/image_path.dart';
import 'package:boozin_fitness/src/utils/strings.dart';
import 'package:boozin_fitness/src/widgets/home_card.dart';
import 'package:flutter/material.dart';
import 'package:health/health.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<HealthDataPoint>? a;

  void ab() async {
    // a = await homeController.addData();
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    HealthFactory health = HealthFactory();
    final types = [
      HealthDataType.STEPS,
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ];
    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];
    List<HealthDataPoint> healthData;
    bool requested = await health.requestAuthorization(types, permissions: permissions);

    if (requested) {
      healthData = await health.getHealthDataFromTypes(yesterday, now, types);
      a = healthData;
    } else {
      print("Authorization not granted");
    }
  }

  @override
  void initState() {
    ab();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              AppText.hi,
              style: TextStyle(
                fontSize: 32,
                fontFamily: AppFont.nunito,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 40),
            HomeCard(
              iconPath: ImagePathLight.iconFootSteps,
              title: 'Steps: ${a?.first.value}',
              goal: '15,000',
            ),
            HomeCard(
              iconPath: ImagePathLight.iconKcal,
              title: 'Calories Burned: ${a?.last.value}',
              goal: '15,000',
            ),
          ],
        ),
      ),
    );
  }
}
