import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCarouselAds extends StatefulWidget {
  const ShimmerCarouselAds({super.key});
  @override
  State<ShimmerCarouselAds> createState() => _ShimmerCarouselAdsState();
}

class _ShimmerCarouselAdsState extends State<ShimmerCarouselAds> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: ShimmerDirection.ltr,
      period: const Duration(milliseconds: 1500),
      baseColor: Theme.of(context).colorScheme.surfaceVariant,
      highlightColor: Theme.of(context).colorScheme.surface,
      child: const Card(
          elevation: 0,
          child: SizedBox(
            child: AspectRatio(
              aspectRatio: 16 / 9,
            ),
          )),
    );
  }
}

class ShimmerNews extends StatefulWidget {
  const ShimmerNews({super.key});
  @override
  State<ShimmerNews> createState() => _ShimmerNewsState();
}

class _ShimmerNewsState extends State<ShimmerNews> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        period: const Duration(milliseconds: 1500),
        baseColor: Theme.of(context).colorScheme.surfaceVariant,
        highlightColor: Theme.of(context).colorScheme.surface,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: SizedBox(
            child: AspectRatio(
              aspectRatio: 16 / 13,
            ),
          ),
        ));
  }
}

class RewardEcardOnloading extends StatefulWidget {
  const RewardEcardOnloading({super.key});
  @override
  State<RewardEcardOnloading> createState() =>
      _RewardEcardOnloadingWidgetState();
}

class _RewardEcardOnloadingWidgetState extends State<RewardEcardOnloading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  width: 600,
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                          child: Column(
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 0, 5),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Shimmer.fromColors(
                                            direction: ShimmerDirection.ltr,
                                            period: const Duration(
                                                milliseconds: 1000),
                                            baseColor: Theme.of(context)
                                                .colorScheme
                                                .surfaceContainerLowest,
                                            highlightColor: Theme.of(context)
                                                .colorScheme
                                                .surfaceVariant,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          'assets/images/profile_card.jpg'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ))),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Shimmer.fromColors(
                                            direction: ShimmerDirection.ltr,
                                            period: const Duration(
                                                milliseconds: 1000),
                                            baseColor: Theme.of(context)
                                                .colorScheme
                                                .surfaceContainerLowest,
                                            highlightColor: Theme.of(context)
                                                .colorScheme
                                                .surfaceVariant,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .surfaceVariant,
                                                  width: 150,
                                                  height: 25,
                                                )),
                                          )
                                        ],
                                      ),
                                    ],
                                  )),
                            ],
                          )),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          width: 600,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage('assets/images/profile_card.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 0, 0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0, 0, 0, 5),
                                            child: Shimmer.fromColors(
                                              direction: ShimmerDirection.ltr,
                                              period: const Duration(
                                                  milliseconds: 1000),
                                              baseColor: const Color.fromARGB(
                                                  255, 43, 8, 156),
                                              highlightColor:
                                                  const Color.fromARGB(
                                                      255, 67, 37, 163),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/images/postalhub_logo.jpg'),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          Shimmer.fromColors(
                                            direction: ShimmerDirection.ltr,
                                            period: const Duration(
                                                milliseconds: 1000),
                                            baseColor: const Color.fromARGB(
                                                255, 43, 8, 156),
                                            highlightColor:
                                                const Color.fromARGB(
                                                    255, 67, 37, 163),
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: Container(
                                                  color: const Color.fromARGB(
                                                      255, 97, 9, 206),
                                                  width: 55,
                                                  height: 10,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Expanded(child: SizedBox()),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 10, 0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Shimmer.fromColors(
                                              direction: ShimmerDirection.ltr,
                                              period: const Duration(
                                                  milliseconds: 1000),
                                              baseColor: const Color.fromARGB(
                                                  255, 97, 9, 206),
                                              highlightColor:
                                                  const Color.fromARGB(
                                                      255, 121, 48, 210),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Container(
                                                    color: const Color.fromARGB(
                                                        255, 97, 9, 206),
                                                    width: 50,
                                                    height: 25,
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Shimmer.fromColors(
                                              direction: ShimmerDirection.ltr,
                                              period: const Duration(
                                                  milliseconds: 1000),
                                              baseColor: const Color.fromARGB(
                                                  255, 97, 9, 206),
                                              highlightColor:
                                                  const Color.fromARGB(
                                                      255, 121, 48, 210),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Container(
                                                    color: const Color.fromARGB(
                                                        255, 97, 9, 206),
                                                    width: 30,
                                                    height: 10,
                                                  )),
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 0, 5, 0),
                                          child: Shimmer.fromColors(
                                            direction: ShimmerDirection.ltr,
                                            period: const Duration(
                                                milliseconds: 1000),
                                            baseColor: const Color.fromARGB(
                                                90, 255, 255, 255),
                                            highlightColor:
                                                const Color.fromARGB(
                                                    151, 255, 255, 255),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Material(
                                                color: const Color.fromARGB(
                                                    38, 255, 255, 255),
                                                child: const SizedBox(
                                                  width: 166,
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 0, 0, 0),
                                          child: Shimmer.fromColors(
                                            direction: ShimmerDirection.ltr,
                                            period: const Duration(
                                                milliseconds: 1000),
                                            baseColor: const Color.fromARGB(
                                                90, 255, 255, 255),
                                            highlightColor:
                                                const Color.fromARGB(
                                                    151, 255, 255, 255),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Material(
                                                color: const Color.fromARGB(
                                                    38, 255, 255, 255),
                                                child: const SizedBox(
                                                  width: 166,
                                                  height: 40,
                                                ),
                                              ),
                                            ),
                                          )),
                                    ],
                                  )),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 15, 10, 10),
                                  child: Shimmer.fromColors(
                                      direction: ShimmerDirection.ltr,
                                      period:
                                          const Duration(milliseconds: 1000),
                                      baseColor: const Color.fromARGB(
                                          255, 149, 149, 149),
                                      highlightColor: Colors.white,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Material(
                                            color: const Color.fromARGB(
                                                255, 149, 149, 149),
                                            child: SizedBox(
                                              width: 595,
                                              height: 70,
                                            ),
                                          ))))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))));
  }
}

class ShimmerRewardWidgets extends StatefulWidget {
  const ShimmerRewardWidgets({super.key});
  @override
  State<ShimmerRewardWidgets> createState() => _ShimmerRewardWidgetsState();
}

class _ShimmerRewardWidgetsState extends State<ShimmerRewardWidgets> {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        period: const Duration(milliseconds: 1500),
        baseColor: Theme.of(context).colorScheme.surfaceVariant,
        highlightColor: Theme.of(context).colorScheme.surface,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: SizedBox(
            child: AspectRatio(
              aspectRatio: 0.75 / 1,
            ),
          ),
        ));
  }
}
