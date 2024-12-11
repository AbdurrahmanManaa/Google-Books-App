import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        bottom: 30,
        left: 30,
        right: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AssetsData.logo,
            height: 16,
            width: 75,
          ),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSearchViewPath);
            },
            child: SvgPicture.asset(
              AssetsData.searchIcon,
              height: 25,
              width: 25,
            ),
          ),
        ],
      ),
    );
  }
}
