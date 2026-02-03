import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllMoviesShimmerList extends StatelessWidget {
  const AllMoviesShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(18),
      itemCount:10,
      separatorBuilder: (_, __) => const SizedBox(height: 15),
      itemBuilder: (context, index) {
        return AllMoviesShimmerItem();
      },
    );
  }


}
class AllMoviesShimmerItem extends StatelessWidget {
  const AllMoviesShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade800,
      highlightColor: Colors.grey.shade600,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Container(
            width: 90,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 12),

          // Text placeholders
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _shimmerBox(height: 18, width: double.infinity),
                const SizedBox(height: 10),
                _shimmerBox(height: 14, width: double.infinity),
                const SizedBox(height: 6),
                _shimmerBox(height: 14, width: 200),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _shimmerBox(height: 14, width: 80),
                    const SizedBox(width: 10),
                    _shimmerBox(height: 14, width: 40),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _shimmerBox({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
