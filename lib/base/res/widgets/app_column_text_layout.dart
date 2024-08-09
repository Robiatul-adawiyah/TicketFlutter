import 'package:flutter/material.dart';
import 'package:tiketflutter/base/res/widgets/text_style_fourth.dart';
import 'package:tiketflutter/base/res/widgets/text_style_third.dart';

class AppColumnTextLayout extends StatelessWidget {
  final String topText;
  final String bottomText;
  final CrossAxisAlignment alignment;
  final bool? isColor;
  const AppColumnTextLayout(
      {super.key,
      required this.topText,
      required this.bottomText,
      required this.alignment,
      this.isColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextStyleThird(
          text: topText,
          isColor: isColor,
        ),
        SizedBox(height: 5),
        TextStyleFourth(
          text: bottomText,
          isColor: isColor,
        ),
      ],
    );
  }
}
