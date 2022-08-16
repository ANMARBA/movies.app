import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:transparent_image/transparent_image.dart';

import 'package:movies_app/commons/constants/constants.dart';
import 'package:movies_app/commons/widgets/widgets.dart';

class Recommendations extends StatelessWidget {
  final List recommendations;

  const Recommendations({Key? key, required this.recommendations})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Text(
              'Recommendations',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recommendations.length,
              shrinkWrap: true,
              itemBuilder: (_, int i) {
                return IntrinsicHeight(
                  child: Container(
                    margin: const EdgeInsetsDirectional.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsetsDirectional.only(end: 10),
                          width: 130,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: FadeInImage.memoryNetwork(
                            image:
                                'https://image.tmdb.org/t/p/original${recommendations[i]["poster_path"]}',
                            placeholder: kTransparentImage,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                recommendations[i]["name"],
                                maxLines: 2,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              const SizedBox(height: 20.0),
                              RatingBar.builder(
                                initialRating:
                                    (recommendations[i]["vote_average"] % 5.0),
                                itemSize: 15.0,
                                ignoreGestures: true,
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                                unratedColor: Constants.thirdColor,
                                onRatingUpdate: (rating) {},
                              ),
                              const SizedBox(height: 20.0),
                              const Text(
                                'IMDb: 9,4',
                                maxLines: 2,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                              const SizedBox(height: 20.0),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    width: 120,
                                    height: 38.0,
                                    child: ElevatedButtonCustom(
                                        title: 'Watch Now'),
                                  ),
                                  const SizedBox(width: 30.0),
                                  FavoriteButton(
                                    // isFavorite: true,
                                    valueChanged: (_isFavourite) {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
