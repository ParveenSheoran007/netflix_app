import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/common/utils.dart'; // Ensure this contains the imageUrl definition
import 'package:netflix_clone/models/tv_series_model.dart';
import 'package:netflix_clone/widgets/landing_card.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    Key? key,
    required this.data,
  }) : super(key: key);

  final TvSeriesModel data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var carouselHeight = (size.height * 0.33 < 300) ? 300.0 : size.height * 0.33;

    var carouselOptions = CarouselOptions(
      height: carouselHeight.toDouble(),
      aspectRatio: 16 / 9,
      viewportFraction: 0.9,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );

    return SizedBox(
      width: size.width,
      height: carouselHeight.toDouble(),
      child: CarouselSlider.builder(
        itemCount: data.results.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          var backdropPath = data.results[index].backdropPath;
          var name = data.results[index].name;

          if (backdropPath == null || name == null) {
            return const Center(
              child: Text("Image or Name not available"),
            );
          }

          var url = backdropPath.toString();
          return GestureDetector(
            onTap: () {
              // Define your onTap action here
            },
            child: LandingCard(
              image: CachedNetworkImageProvider("$imageUrl$url"),
              name: name,
            ),
          );
        },
        options: carouselOptions,
      ),
    );
  }
}
