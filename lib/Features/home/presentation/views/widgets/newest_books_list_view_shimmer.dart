import 'package:booklyapp/Features/home/presentation/views/widgets/book_list_view_item_shimmer.dart';
import 'package:booklyapp/constants.dart';
import 'package:flutter/material.dart';

class NewestBooksListViewShimmer extends StatelessWidget {
  const NewestBooksListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kHorizontalPadding,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 15,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: BookListViewItemShimmer(),
            );
          }),
    );
  }
}
