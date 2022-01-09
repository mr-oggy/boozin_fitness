import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  const ShowImage({required this.imagePath, Key? key}) : super(key: key);
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height * 9,
      // width: MediaQuery.of(context).size.width * 1,
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
