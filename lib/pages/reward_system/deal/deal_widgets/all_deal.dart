import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/deal_page/all_deal_page.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/deal_widgets/no_reward_handler.dart';
import 'package:postalhub_tracker/pages/reward_system/deal/viewer.dart';
import 'package:postalhub_tracker/src/ui_components/shimmer_loading_animation.dart';

class AllDealRewards extends StatefulWidget {
  const AllDealRewards({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _AllDealRewardsState createState() => _AllDealRewardsState();
}

class _AllDealRewardsState extends State<AllDealRewards> {
  List<DocumentSnapshot> documents = [];
  bool isLoading = true;

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
          .limit(5)
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
                "All Deals",
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
                        builder: (context) => const AllDealPage()),
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
              itemSnapping: true,
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

class RewardCard extends StatelessWidget {
  const RewardCard({super.key, required this.doc});

  final Map<String, dynamic> doc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        /// BACKGROUND IMAGE
        ClipRect(
          child: OverflowBox(
            maxWidth: 200, // same fixed card width
            minWidth: 200,
            minHeight: 260,
            maxHeight: 260,
            child: Image.network(
              doc['rewardImage'],
              fit: BoxFit.cover,
            ),
          ),
        ),

        ///TINT
        Container(
          width: 200,
          height: 260,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),

        ///CONTENT
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                doc['rewardTitle'] ?? "",
                overflow: TextOverflow.clip,
                maxLines: 2,
                softWrap: false,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                doc['rewardProvider'] ?? "",
                maxLines: 1,
                overflow: TextOverflow.clip,
                softWrap: false,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 14.5),
              ),
              SizedBox(height: 5),
              Text(
                "${doc['rewardPointValue'] ?? 0} points",
                overflow: TextOverflow.clip,
                softWrap: false,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
