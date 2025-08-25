// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/deal_widgets/all_deal.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/deal_widgets/community_program.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/deal_widgets/entertainment_deal.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/deal_widgets/food_deal.dart';
import 'package:postalhub_tracker/pages/reward_system/reward_ecard.dart';

class Reward extends StatefulWidget {
  const Reward({super.key});
  @override
  _RewardState createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Rewards"),
        ),
        body: ListView(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                child: RewardEcard()),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: AllDealRewards()),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: FoodAndBeverage()),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: EntertainmentDeal()),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: CommunityProgram()),
          ],
        ));
  }
}
