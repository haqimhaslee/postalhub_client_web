import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class CarouselAds extends StatefulWidget {
  const CarouselAds({super.key});
  @override
  State<CarouselAds> createState() => _CarouselAdsState();
}

class _CarouselAdsState extends State<CarouselAds> {
  List<String> imageUrls = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    fetchCarouselImages();
  }

  Future<void> fetchCarouselImages() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('carouselServices').get();
      setState(() {
        imageUrls =
            snapshot.docs.map((doc) => doc['image_url'] as String).toList();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        errorMessage = 'Error: $error';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Shimmer.fromColors(
        direction: ShimmerDirection.ltr,
        period: const Duration(milliseconds: 1500),
        baseColor: Theme.of(context).colorScheme.surfaceContainerLowest,
        highlightColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        child: const Card(
            elevation: 0,
            child: SizedBox(
              child: AspectRatio(
                aspectRatio: 16 / 8.03,
              ),
            )),
      );
    }
    if (errorMessage != null) {
      return Center(child: Text(errorMessage!));
    }
    if (imageUrls.isEmpty) {
      return const Center(child: Text('No images found'));
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: CarouselSlider(
        options: CarouselOptions(
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 7.6,
          autoPlayCurve: Curves.easeInOut,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 1100),
          autoPlayInterval: const Duration(seconds: 7),
          viewportFraction: 0.85,
        ),
        items: imageUrls.map((imageUrl) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 0.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                ),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    direction: ShimmerDirection.ltr,
                    period: const Duration(milliseconds: 1500),
                    baseColor:
                        Theme.of(context).colorScheme.surfaceContainerLowest,
                    highlightColor:
                        Theme.of(context).colorScheme.surfaceContainerHighest,
                    child: const AspectRatio(
                      aspectRatio: 16 / 9,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
