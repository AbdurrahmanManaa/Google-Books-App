import 'package:booklyapp/Features/home/presentation/views/widgets/can_like_list_view.dart';
import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CanLikeSection extends StatelessWidget {
  const CanLikeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: kHorizontalPadding,
          child: Text(
            'You can also like',
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: 20,
          ),
          child: CanLikeListView(),
        ),
      ],
    );
  }
}
