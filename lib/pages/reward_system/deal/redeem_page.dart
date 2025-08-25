// ignore_for_file: use_build_context_synchronously, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:postalhub_tracker/src/ui_components/gradient_background.dart';
import 'package:action_slider/action_slider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RedeemPage extends StatefulWidget {
  final String imgurl;
  final String title;
  final String description;
  final int rewardPointValue;

  const RedeemPage({
    super.key,
    required this.imgurl,
    required this.title,
    required this.description,
    required this.rewardPointValue,
  });

  @override
  State<RedeemPage> createState() => _RedeemPageState();
}

class _RedeemPageState extends State<RedeemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          GradientBackground(),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50.0),
                    Text(
                      'REDEEM YOUR REWARD!',
                      style:
                          TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                    ),
                    const SizedBox(height: 90.0),
                    SizedBox(
                      width: 350,
                      child: ClipRRect(
                        borderRadius:
                            BorderRadiusGeometry.all(Radius.circular(40)),
                        child: Image.network(widget.imgurl),
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    SizedBox(
                      width: 340,
                      child: Text(
                        widget.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      ("${widget.rewardPointValue} points"),
                      style: TextStyle(
                        fontSize: 17,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 90.0),
                    ActionSlider.dual(
                      boxShadow: [],
                      actionThresholdType: ThresholdType.release,
                      sliderBehavior: SliderBehavior.stretch,
                      icon: Icon(
                        Icons.code_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 30,
                      ),
                      successIcon: Icon(
                        Icons.check_rounded,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 35,
                      ),
                      failureIcon: Icon(
                        Icons.close_rounded,
                        color: Colors.red,
                        size: 35,
                      ),
                      loadingIcon: SizedBox(
                        height: 35,
                        width: 35,
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.onPrimary,
                          year2023: false,
                        ),
                      ),
                      height: 75,
                      width: 350.0,
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      toggleColor: Theme.of(context).colorScheme.primary,
                      startAction: (controller) async {
                        controller.failure();
                        Fluttertoast.showToast(
                          msg: "Cancelled",
                        );
                        await Future.delayed(const Duration(seconds: 1));
                        controller.reset();
                        Navigator.pop(context);
                      },
                      endAction: (controller) async {
                        controller.loading();
                        await Future.delayed(const Duration(seconds: 2));
                        controller.failure();
                        await Future.delayed(const Duration(seconds: 1));
                        controller.reset();
                        Fluttertoast.showToast(
                          msg:
                              "Reward redemption not available. Please download mobile version from PLay Store/App Store",
                        );
                        Navigator.pop(context);
                      },
                      startChild: const Text(
                        'CANCEL',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                      endChild: const Text(
                        'REDEEM',
                        style: TextStyle(fontWeight: FontWeight.w900),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Swipe the slider to REDEEM (Right) or CANCEL (Left)',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
