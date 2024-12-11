import 'package:booklyapp/Features/home/presentation/views/widgets/featured_item_list_view_bloc_consumer.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/newest_books_list_view_bloc_builder.dart';
import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomHomeAppBar(),
              Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: FeaturedItemListViewBlocConsumer(),
              ),
              SizedBox(
                height: 49,
              ),
              Padding(
                padding: kHorizontalPadding,
                child: Text(
                  'Newest Books',
                  style: Styles.textStyle18,
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverFillRemaining(
          child: NewestBooksListViewBlocBuilder(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        )
      ],
    );
  }
}
