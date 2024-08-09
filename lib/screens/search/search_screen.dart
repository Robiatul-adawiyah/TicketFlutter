import 'package:flutter/material.dart';
import 'package:tiketflutter/base/res/styles/app_styles.dart';
import 'package:tiketflutter/screens/search/widgets/app_text_icon.dart';
import 'package:tiketflutter/screens/search/widgets/app_ticket_tabs.dart';
import 'package:tiketflutter/screens/search/widgets/find_tickets.dart';
import 'package:tiketflutter/base/res/styles/app_double_text.dart';
import 'package:tiketflutter/screens/search/widgets/ticket_promotion.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      body: ListView(
        //padding EdgeInsets.symmetric(horizontal: 20, vertical: 20) buat text jrak kiri kanann
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'What are\n you looking for?',
            style: AppStyles.headLineStyle1.copyWith(fontSize: 35),
          ),
          // const AppTicketTabs(), menghubungkan ke
          //halaman consy tiketnya
          const SizedBox(
            height: 20,
          ),
          const AppTicketTabs(
            firstTab: 'All Tickets',
            secondTab: 'Hotels',
          ),
          const SizedBox(
            height: 25,
          ),
          const AppTextIcon(
            icon: Icons.flight_takeoff_rounded,
            text: "Departure",
          ),
          const SizedBox(
            height: 20,
          ),
          const AppTextIcon(
            icon: Icons.flight_land_rounded,
            text: "Arrival",
          ),
//const FindTickets(), menghubungkan kehalaman find
          const SizedBox(
            height: 25,
          ),
          const FindTickets(),
          const SizedBox(
            height: 40,
          ),
          AppDoubleText(
            bigText: 'Upcoming flights',
            smallText: 'view all',
            func: () => Navigator.pushNamed(context, "/all_tickets"),
          ),

          const SizedBox(
            height: 15,
          ),
          TicketPromotion(),

          // /n membuat text you looking for nya kebawah
        ],
      ),
    );
  }
}
