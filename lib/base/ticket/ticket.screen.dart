import 'package:tiketflutter/base/res/styles/media.dart';
import 'package:tiketflutter/base/res/widgets/app_column_text_layout.dart';
import 'package:flutter/material.dart';
import 'package:tiketflutter/base/res/styles/app_styles.dart';
import 'package:tiketflutter/base/res/widgets/app_layoutbuilder_widget.dart';
import 'package:tiketflutter/base/res/widgets/ticket_view.dart';
import 'package:tiketflutter/base/ticket/widgets/ticket_positined_circles.dart';
import 'package:tiketflutter/base/utils/all_json.dart';
import 'package:tiketflutter/screens/search/widgets/app_ticket_tabs.dart';

class Ticketscreen extends StatefulWidget {
  const Ticketscreen({
    super.key,
  });

  @override
  State<Ticketscreen> createState() => _TicketscreenState();
}

class _TicketscreenState extends State<Ticketscreen> {
  late int ticketIndex = 0;

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      var args = ModalRoute.of(context)!.settings.arguments as Map;
      print("passed index ${args["index"]}");
      ticketIndex = args["index"];
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.bgColor,
      appBar: AppBar(
        title: Text("Tickets"),
        backgroundColor: AppStyles.bgColor,
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            children: [
              //const SizedBox(
              // height: 40,
              //),
              //Text(
              //'Tickets',
              //style: AppStyles.headLineStyle1,
              // ),
              const SizedBox(
                height: 20,
              ),
              AppTicketTabs(
                firstTab: 'Upcoming',
                secondTab: 'Previous',
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                //margin:const EdgeInsets.only(right: wholeScreen == true ? 0 : 16),
                padding: EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[0],
                  isColor: true,
                ),
              ),
              //SizedBox(heigh: 1,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                color: AppStyles.ticketColor,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "Flutter DB",
                          bottomText: "Pasenger",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "5221 36869",
                          bottomText: "passport",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLayoutbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppColumnTextLayout(
                          topText: "2465 65849440",
                          bottomText: "Number of E-ticket ",
                          alignment: CrossAxisAlignment.start,
                          isColor: true,
                        ),
                        AppColumnTextLayout(
                          topText: "B46859",
                          bottomText: "Booking Code",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    const AppLayoutbuilderWidget(
                      randomDivider: 15,
                      width: 5,
                      isColor: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              //scale: 11, memperkecil gambar
                              children: [
                                Image.asset(
                                  AppMedia.visa_card,
                                  scale: 11,
                                ),
                                Text(
                                  "*** 2462",
                                  style: AppStyles.headLineStyle3,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Payment method",
                              style: AppStyles.headLineStyle4,
                            )
                          ],
                        ),
                        AppColumnTextLayout(
                          topText: "\$249.99",
                          bottomText: "Price",
                          alignment: CrossAxisAlignment.end,
                          isColor: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    color: AppStyles.ticketColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(21),
                        bottomLeft: Radius.circular(21))),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Center(
                      child: Image.asset(
                        AppMedia.barcode,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //color full tieket
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: TicketView(
                  ticket: ticketList[0],
                ),
              ),
            ],
          ),
          TicketPositinedCircle(
            pos: true,
          ),
          TicketPositinedCircle(
            pos: null,
          ),
        ],
      ),
    );
  }
}
