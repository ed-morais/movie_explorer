import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStars extends StatelessWidget {
  final double? rating;
  const RatingStars({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
    rating: rating!/2,
    itemBuilder: (context, index) => const Icon(
         Icons.star,
         color: Colors.green,
    ),
    itemCount: 5,
    itemSize: 30.0,
    direction: Axis.horizontal,
);
    
  }
}
