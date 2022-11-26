import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../resources/services-dimens.dart';
class RatingBarWidget extends StatelessWidget {
  final double?itemSize;
  const RatingBarWidget({Key? key ,this.itemSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize:itemSize?? ServicesDimens.h5,
      initialRating: 4.5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding:const EdgeInsets.symmetric(horizontal: 2.0),
      itemBuilder: (context, _) =>const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
      },
    );
  }
}
