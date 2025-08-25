import 'package:flutter/material.dart';

class NoRewardHandler extends StatefulWidget {
  const NoRewardHandler({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NoRewardHandlerState createState() => _NoRewardHandlerState();
}

class _NoRewardHandlerState extends State<NoRewardHandler> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        child: Material(
          color: Theme.of(context).colorScheme.surfaceVariant,
          child: InkWell(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/components/not_available.png",
                    scale: 4,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "No reward or program available",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
