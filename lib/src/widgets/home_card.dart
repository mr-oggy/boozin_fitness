import 'package:boozin_fitness/src/utils/font_style.dart';
import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({required this.title, required this.goal, required this.iconPath, Key? key}) : super(key: key);
  final String iconPath;
  final String title;
  final String goal;
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
                    Text(
                      title,
                    ),
                    const SizedBox(height: 16),
                    const Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: 0.8,
                          valueColor: AlwaysStoppedAnimation(Color(0xFF000000)),
                          backgroundColor: Color(0xFFC4C4C4),
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
                          'Goal: $goal',
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
