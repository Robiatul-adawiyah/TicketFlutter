import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiketflutter/base/res/styles/app_styles.dart';
//import 'package:tiketflutter/base/res/styles/media.dart';

class Hotel extends StatelessWidget {
  final Map<String, dynamic> hotel;
  Hotel({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: size.width * 0.6,
      height: 350,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
                color: AppStyles.primaryColor,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  //fit box membuat warna birunya kebawah  dan gmbr diatas
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/${hotel['image']}"),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              hotel['destination'],
              style: AppStyles.headLineStyle1.copyWith(
                color: AppStyles.kakiColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              hotel['place'],
              style: AppStyles.headLineStyle3.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "\$${hotel['price']}/night",
              style: AppStyles.headLineStyle1.copyWith(
                color: AppStyles.kakiColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
