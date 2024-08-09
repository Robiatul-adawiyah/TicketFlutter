import 'package:flutter/material.dart';
import 'package:tiketflutter/base/res/styles/app_styles.dart';

class TicketPositinedCircle extends StatelessWidget {
  final bool? pos;
  const TicketPositinedCircle({super.key, this.pos});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: pos == true ? 22 : null,
      top: 250,
      right: pos == true ? null : 22,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2, color: AppStyles.textColor),
        ),
        child: CircleAvatar(
          maxRadius: 4,
          backgroundColor: AppStyles.textColor,
        ),
      ),
    );
  }
}
