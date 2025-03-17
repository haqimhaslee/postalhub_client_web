import 'package:flutter/material.dart';

class CarouselViewer extends StatelessWidget {
  const CarouselViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: AspectRatio(
        aspectRatio: 16 / 8, // Ensures a 16:9 ratio
        child: CarouselView.weighted(
          itemSnapping: true,
          flexWeights: const [7, 1],
          enableSplash: false,
          children: [
            Image.asset(
              "assets/images/carousel/1.png",
              fit: BoxFit.fitHeight,
            ),
            Image.asset(
              "assets/images/carousel/2.png",
              fit: BoxFit.fitHeight,
            ),
            Image.asset(
              "assets/images/carousel/3.png",
              fit: BoxFit.fitHeight,
            ),
            Image.asset(
              "assets/images/carousel/4.png",
              fit: BoxFit.fitHeight,
            ),
            Image.asset(
              "assets/images/carousel/5.png",
              fit: BoxFit.fitHeight,
            ),
            Image.asset(
              "assets/images/carousel/6.png",
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }
}
