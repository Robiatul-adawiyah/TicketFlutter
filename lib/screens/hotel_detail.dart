import 'package:flutter/material.dart';
import 'package:tiketflutter/base/res/styles/app_styles.dart';
import 'package:tiketflutter/base/utils/all_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;
  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args["index"]);
    index = args["index"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyles.primaryColor,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              // title: Text(
              //  hotelList[index]["place"],
              // ),
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/${hotelList[index]["image"]}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      color: Colors.black.withOpacity(0.3),
                      child: Text(
                        hotelList[index]["place"],
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                  blurRadius: 10.0,
                                  color: AppStyles.primaryColor,
                                  offset: Offset(2.0, 2.0))
                            ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    " Hotels play a pivotal role in the travel and hospitality industry, providing accommodations and services that enhance the overall travel experience. From luxurious five-star resorts to budget-friendly hostels, hotels cater to a wide range of needs and preferences. This article delves into various aspects of hotels, including their types, services, and the factors to consider when choosing one. ",
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "More images",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )),
                Container(
                  height: 200.0,
                  child: ListView.builder(
                      //membuat scroll horizontal
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: EdgeInsets.all(6),
                            child: Image.asset(
                              'assets/images/${hotelList[index]["image"]}',
                            ));
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
