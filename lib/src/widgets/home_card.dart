import 'package:boozin_fitness/src/extensions/theme_value.dart';
import 'package:boozin_fitness/src/utils/colors.dart';
import 'package:boozin_fitness/src/utils/font_style.dart';
import 'package:boozin_fitness/src/utils/strings.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard(
      {required this.title,
      required this.goal,
      required this.iconPath,
      required this.heading,
      required this.value,
      Key? key})
      : super(key: key);
  final String iconPath;
  final String title;
  final String goal;
  final String heading;
  final double value;
  final TextStyle _titleStyle = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    fontFamily: AppFont.nunito,
  );
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 122,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(17, 16, 8, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$heading: ',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFont.montserrat,
                            ),
                          ),
                          TextSpan(
                            text: title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFont.nunito,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Flexible(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          /// change the value of the progress bar
                          value: value / 100,
                          valueColor: AlwaysStoppedAnimation(
                            context.themeValue(light: AppColor.black, dark: AppColor.white),
                          ),
                          backgroundColor: AppColor.white,
                          minHeight: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '0',
                          style: _titleStyle,
                        ),
                        Text(
                          '${AppText.goal}: $goal',
                          style: _titleStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 21),
              SizedBox(
                height: 52,
                width: 52,
                child: Image.asset(iconPath),
              )
            ],
          ),
        ),
      ),
    );
  }
}
