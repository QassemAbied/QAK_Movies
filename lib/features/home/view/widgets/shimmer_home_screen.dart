import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class BannerShimmer extends StatelessWidget {
  const BannerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BannerShimmer(),
          SizedBox(height: 20),
          //   backgroundColor: const Color(0xFF0B1C2D),
          sectionTitleShimmer(),
          SizedBox(height: 12),
          HorizontalListShimmer(),

          SizedBox(height: 24),
          sectionTitleShimmer(),
          SizedBox(height: 12),
          HorizontalListShimmer(),
          SizedBox(height: 24),
          sectionTitleShimmer(),
          SizedBox(height: 12),
          HorizontalListShimmer(),
          SizedBox(height: 24),
          sectionTitleShimmer(),
          SizedBox(height: 12),
          HorizontalListShimmer(),
        ],
      ),
    );
  }
}

class sectionTitleShimmer extends StatelessWidget {
  const sectionTitleShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: Container(
        width: 120,
        height: 20,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    );
  }
}

class HorizontalListShimmer extends StatelessWidget {
  const HorizontalListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return const MovieCardShimmer();
        },
      ),
    );
  }
}

class MovieCardShimmer extends StatelessWidget {
  const MovieCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade700,
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
