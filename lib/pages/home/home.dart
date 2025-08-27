import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/newsletter/widget_homescreen.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/carousel/carousel_ads.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/quickaction_widget.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/greetings.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/deal_widgets/all_deal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: ClipRRect(
                  child: SizedBox(width: 600, child: Greetings()),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SizedBox(
                width: 600,
                child: CarouselAds(),
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(12, 13, 12, 0),
                child: SizedBox(
                  width: 600,
                  child: QuickactionWidget(),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 13, 0, 0),
              child: SizedBox(
                child: AllDealRewards(),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              child: SizedBox(
                width: 600,
                child: AnnouncementWidget(),
              ),
            )
          ],
        ),
      ],
    ));
  }
}
