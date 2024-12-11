import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/book_details_section.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/can_like_section.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custome_book_details_app_bar.dart';
import 'package:booklyapp/constants.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookEntity});

  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                Padding(
                  padding: kHorizontalPadding,
                  child: BookDetailsSection(
                    bookEntity: bookEntity,
                  ),
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                const CanLikeSection(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
