import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image_shimmer.dart';
import 'package:booklyapp/core/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';

class CanLikeListViewShimmer extends StatelessWidget {
  const CanLikeListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: CustomBookImageShimmer(),
            );
          },
        ),
      ),
    );
  }
}
