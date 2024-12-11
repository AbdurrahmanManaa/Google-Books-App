import 'package:booklyapp/Features/home/presentation/views/widgets/book_list_view_item_shimmer.dart';
import 'package:booklyapp/core/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';

class SearchResultsListViewShimmer extends StatelessWidget {
  const SearchResultsListViewShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: 15,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: BookListViewItemShimmer(),
          );
        },
      ),
    );
  }
}
