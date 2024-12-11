import 'package:booklyapp/constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerEffect extends StatelessWidget {
  const CustomShimmerEffect({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: kShimmerDuration,
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}
