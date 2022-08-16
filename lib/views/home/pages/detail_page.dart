import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:movies_app/domain/entities/tv/tv.dart';
import 'package:movies_app/views/home/home.dart';

class DetailPage extends StatelessWidget {
  final List<Tv> series;
  final int currentSerie;
  const DetailPage({
    Key? key,
    required this.series,
    required this.currentSerie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.secondColor,
      appBar: const CustomAppBar(
        title: 'Popular',
        centerTitle: false,
        visibleSettings: false,
      ),
      body: SafeArea(child: sliderPlugin()),
    );
  }

  sliderPlugin() {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 0.5,
        viewportFraction: 0.7,
        initialPage: currentSerie,
        enlargeCenterPage: true,
        enableInfiniteScroll: true,
      ),
      items: series.map<Widget>((i) {
        return Builder(
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: FadeInImage.memoryNetwork(
                      image:
                          'https://image.tmdb.org/t/p/original${i.posterPath}',
                      placeholder: kTransparentImage,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    margin: const EdgeInsetsDirectional.only(top: 50),
                    child: Column(
                      children: [
                        Text(
                          i.name,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.headline3,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 25.0),
                        RatingBar.builder(
                          initialRating: (i.voteAverage % 5.0),
                          itemSize: 20.0,
                          ignoreGestures: true,
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.white,
                          ),
                          unratedColor: Constants.thirdColor,
                          onRatingUpdate: (rating) {},
                        ),
                        const SizedBox(height: 25.0),
                        Text(
                          'IMDb: ${i.voteAverage}',
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(height: 25.0),
                        const SizedBox(
                          width: 200,
                          height: 50.0,
                          child: ElevatedButtonCustom(title: 'Watch Now'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
