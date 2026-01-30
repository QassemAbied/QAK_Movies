import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class DetailsShimmerLoading extends StatelessWidget {
  const DetailsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          const ShimmerBox(
            width: double.infinity,
            height: 250,
            borderRadius: BorderRadius.zero,
          ),

          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// Title
                const ShimmerBox(width: 220, height: 25),

                const SizedBox(height: 15),

                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// Poster
                    ShimmerBox(width: 150, height: 220),

                    SizedBox(width: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerBox(width: 180, height: 20),
                        SizedBox(height: 10),
                        ShimmerBox(width: 120, height: 20),
                        SizedBox(height: 20),
                        ShimmerBox(width: 80, height: 40),
                      ],
                    )

                  ],
                ),

                const SizedBox(height: 25),

                /// Overview Lines
                const ShimmerBox(width: double.infinity, height: 18),
                const SizedBox(height: 8),
                const ShimmerBox(width: double.infinity, height: 18),
                const SizedBox(height: 8),
                const ShimmerBox(width: 250, height: 18),

                const SizedBox(height: 30),

                /// Trailer
                const ShimmerBox(width: double.infinity, height: 200),

                const SizedBox(height: 30),

                /// Horizontal list
                SizedBox(
                  height: 180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    separatorBuilder: (_, __) =>
                    const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return const ShimmerBox(
                        width: 140,
                        height: 180,
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShimmerBox extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;

  const ShimmerBox({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor:  Colors.grey.shade700,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
