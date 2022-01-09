import 'package:boozin_fitness/src/utils/animate_with_blink.dart';
import 'package:boozin_fitness/src/utils/font_style.dart';
import 'package:boozin_fitness/src/utils/image_path.dart';
import 'package:boozin_fitness/src/utils/strings.dart';
import 'package:boozin_fitness/src/widgets/show_image.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _visible = false;
  bool align = false;

  _setAnimation() => setState(() {
        align = !align;
      });

  @override
  void initState() {
    initSetup().then((_) async {
      // Once setup is complete then load the animation
      _setAnimation();
      await Future.delayed(const Duration(milliseconds: 100));
      setupComplete();
    });

    super.initState();
  }

  /// Call all the futures that need to be resolved before the app can start
  Future<void> initSetup() {
    /// This is sample delay to represent the loading of the app
    return Future.delayed(const Duration(seconds: 2));
  }

  void setupComplete() async {
    // Once setup is complete then load the animation and do the necessary navigation
    _visible = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                AnimatedAlign(
                  duration: const Duration(milliseconds: 500),
                  alignment: align ? const Alignment(0.33, 0) : Alignment.center,
                  child: const ShowImage(
                    imagePath: ImagePathCommon.splashI,
                  ),
                ),
                if (align)
                  AnimateWithBlink(
                    visible: _visible,
                    child: const ShowImage(
                      imagePath: ImagePathLight.splashBoozin,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            AnimateWithBlink(
              visible: _visible,
              child: const Text(
                AppText.fitness,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: AppFont.nunito,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
