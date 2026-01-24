import 'package:flutter/material.dart';

class PartialStar extends StatelessWidget {
  final double fillPercent; // من 0.0 → 1.0
  final double size;

  const PartialStar({
    super.key,
    required this.fillPercent,
    this.size = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.star,
          size: size,
          color: Colors.grey.shade400,
        ),
        ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: fillPercent.clamp(0.0, 1.0),
            child: Icon(
              Icons.star,
              size: size,
              color: Colors.amber,
            ),
          ),
        ),
      ],
    );
  }
}

class RatingStars extends StatelessWidget {
  final double rating; // من 0 → 5
  final double size;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 15,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        final starValue = rating - index;

        if (starValue >= 1) {
          return Icon(
            Icons.star,
            color: Colors.amber,
            size: size,
          );
        } else if (starValue > 0) {
          return PartialStar(
            fillPercent: starValue,
            size: size,
          );
        } else {
          return Icon(
            Icons.star,
            color: Colors.grey.shade400,
            size: size,
          );
        }
      }),
    );
  }
}