import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/widgets.dart';
import 'package:tiketflutter/base/res/styles/app_double_text.dart';
import 'package:tiketflutter/base/res/styles/app_styles.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:tiketflutter/base/res/widgets/ticket_view.dart';
import 'package:tiketflutter/base/utils/all_json.dart';
import 'package:tiketflutter/base/utils/app_routes.dart';
import 'package:tiketflutter/screens/widgets/hotel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Column //row
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  //membuat kekiri harus dibuat codena main
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Good morning',
                          style: AppStyles.headLineStyle3,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text('Rpl Tickets', style: AppStyles.headLineStyle1),
                      ],
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/logo.jpg'),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFF4F6FD),
                  ),
                  child: const Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        FluentSystemIcons.ic_fluent_search_regular,
                        color: Color(0xFFBFC205),
                      ),
                      Text('search'),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 40,
                ),
                AppDoubleText(
                  bigText: 'Upcoming flights',
                  smallText: 'view all',
                  func: () =>
                      Navigator.pushNamed(context, AppRoutes.allTickets),
                ),

                const SizedBox(height: 20),
                //untuk halaman appdouble

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: ticketList
                        .map((singleTicket) => TicketView(
                              ticket: singleTicket,
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 10),
                AppDoubleText(
                  bigText: 'Hotels',
                  smallText: 'view all',
                  func: () => Navigator.pushNamed(context, AppRoutes.allHotels),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: hotelList
                        .take(3)
                        .map((singleHotel) => Hotel(
                              hotel: singleHotel,
                            ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
