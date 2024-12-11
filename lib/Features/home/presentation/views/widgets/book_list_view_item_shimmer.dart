import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image_shimmer.dart';
import 'package:booklyapp/core/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';

class BookListViewItemShimmer extends StatelessWidget {
  const BookListViewItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            const CustomBookImageShimmer(),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: 180,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 10,
                    width: 120,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 40,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Container(
                        height: 10,
                        width: 40,
                        color: Colors.white,
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
  }
}
