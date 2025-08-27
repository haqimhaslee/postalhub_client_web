import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/deal_page/case_deal_page.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/deal_widgets/all_deal.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/deal_widgets/components/no_reward_handler.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/viewer.dart';
import 'package:postalhub_tracker/src/ui_components/shimmer_loading_animation.dart';

class FoodAndBeverage extends StatefulWidget {
  const FoodAndBeverage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _FoodAndBeverageState createState() => _FoodAndBeverageState();
}

class _FoodAndBeverageState extends State<FoodAndBeverage> {
  List<DocumentSnapshot> documents = [];
  bool isLoading = true;
  final String _case = 'food';

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    if (mounted) {
      setState(() {
        isLoading = true;
      });
    }

    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('rewardLibrary')
          .where('rewardTag', isEqualTo: 'food')
          .limit(8)
          .get();

      if (mounted) {
        setState(() {
          documents = querySnapshot.docs;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false; // Handle error state if needed
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 0, top: 0),
              child: Text(
                "Food & Beverage",
                style: TextStyle(
                  fontSize: 23,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 25,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CaseDealPage(caseData: _case)),
                  );
                },
                child: const Text(
                  'VIEW MORE',
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (isLoading)
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: SizedBox(
                height: 260,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    children: [
                      ShimmerRewardWidgets(),
                      ShimmerRewardWidgets(),
                      ShimmerRewardWidgets(),
                    ],
                  ),
                ),
              ))
        else if (documents.isEmpty)
          NoRewardHandler()
        else
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 260),
            child: CarouselView(
              itemSnapping: false,
              itemExtent: 200,
              onTap: (index) {
                final doc = documents[index];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DealViewer(
                      rewardLimited: doc['rewardLimited'],
                      rewardStock: doc['rewardStock'],
                      title: doc['rewardTitle'],
                      description: doc['rewardDescription'],
                      imageUrl: doc['rewardImage'],
                      provider: doc['rewardProvider'],
                      rewardPointValue: doc['rewardPointValue'],
                    ),
                  ),
                );
              },
              children: documents.map((doc) {
                final data = doc.data()
                    as Map<String, dynamic>; // Firestore snapshot -> Map
                return RewardCard(doc: data);
              }).toList(),
            ),
          )
      ],
    );
  }
}
