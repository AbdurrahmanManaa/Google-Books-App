import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image_shimmer.dart';
import 'package:booklyapp/core/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';

class FeaturedBooksListViewShimmer extends StatelessWidget {
  const FeaturedBooksListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(left: 15),
              child: CustomBookImageShimmer(),
            );
          },
        ),
      ),
    );
  }
}
