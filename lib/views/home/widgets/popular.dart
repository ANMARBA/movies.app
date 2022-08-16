import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies_app/commons/constants/constants.dart';
import 'package:transparent_image/transparent_image.dart';

class Popular extends StatelessWidget {
  final List popular;

  const Popular({Key? key, required this.popular}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: Text(
              'Popular',
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: popular.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, int i) {
                return Container(
                  width: 160.0,
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: FadeInImage.memoryNetwork(
                          image:
                              'https://image.tmdb.org/t/p/original${popular[i]["poster_path"]}',
                          placeholder: kTransparentImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Text(
                        popular[i]["name"],
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 12.0),
                      RatingBar.builder(
                        initialRating: (popular[i]["vote_average"] % 5.0),
                        itemSize: 15.0,
                        ignoreGestures: true,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.white,
                        ),
                        unratedColor: Constants.thirdColor,
                        onRatingUpdate: (rating) {},
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsetsDirectional.only(bottom: 5),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "See All ",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: Constants.primaryColor),
                    ),
                    const WidgetSpan(
                      child: Icon(Icons.arrow_forward_ios,
                          color: Constants.primaryColor),
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
