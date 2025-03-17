// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/announcement_widget.dart';
import 'package:postalhub_tracker/pages/home/home_widgets/carousel_ads.dart';
import 'package:postalhub_tracker/pages/profile/profile_widget.dart';
//import 'package:postalhub_tracker/pages/home/home_widgets/quickaction_widget.dart';

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
      children: const <Widget>[
        Column(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(15, 18, 15, 30),
                child: ClipRRect(
                  child: SizedBox(
                    width: 600,
                    child: ProfileOverviewWidget(),
                  ),
                )),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: ClipRRect(
                  //borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    width: 600,
                    child: CarouselAds(),
                  ),
                )),
            /*
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: ClipRRect(
                      child: SizedBox(
                        width: 600,
                        child: QuickactionWidget(),
                      ),
                    )),

                    */
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: ClipRRect(
                  child: SizedBox(
                    width: 500,
                    child: AnnouncementWidget(),
                  ),
                ))
          ],
        ),
      ],
    ));
  }
}
