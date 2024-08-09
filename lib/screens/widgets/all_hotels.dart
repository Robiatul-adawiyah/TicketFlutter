import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiketflutter/base/res/styles/app_styles.dart';
import 'package:tiketflutter/base/utils/all_json.dart';
import 'package:tiketflutter/base/utils/app_routes.dart';
import 'package:tiketflutter/screens/widgets/hotel.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("All Hotels")),
        backgroundColor: AppStyles.bgColor,
      ),

      // code buat grid
      body: Container(
        margin: EdgeInsets.only(left: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //maksudnya berapa kotak untuk gridnya
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              childAspectRatio: 0.9,
            ),
            itemCount: hotelList.length,
            itemBuilder: (context, index) {
              var singleHotel = hotelList[index];
              return HotelGridView(hotel: singleHotel, index: index);
            },
          ),
        ),
      ),
      // sampe sini
    );
  }
}

class HotelGridView extends StatelessWidget {
  final Map<String, dynamic> hotel;
  final int index;
  HotelGridView({super.key, required this.hotel, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.hotelDetail,
            arguments: {"index": index});
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        // width: size.width * 0.6,
        height: 350,
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: AppStyles.primaryColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyles.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    //fit box membuat warna birunya kebawah  dan gmbr diatas
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/${hotel['image']}"),
                  ),
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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    hotel['destination'],
                    style: AppStyles.headLineStyle3.copyWith(
                      color: AppStyles.kakiColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "\$${hotel['price']}/night",
                    style: AppStyles.headLineStyle4.copyWith(
                      color: AppStyles.kakiColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
