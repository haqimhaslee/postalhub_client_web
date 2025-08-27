import 'package:flutter/material.dart';

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
