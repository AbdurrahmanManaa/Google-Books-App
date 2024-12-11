import 'package:booklyapp/Features/home/presentation/manager/relevant_books_cubit/relevant_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/can_like_list_view_shimmer.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/widgets/custome_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CanLikeListView extends StatelessWidget {
  const CanLikeListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelevantBooksCubit, RelevantBooksState>(
      builder: (context, state) {
        if (state is RelevantBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(AppRouter.kBookDetailsViewPath,
                        extra: state.books[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: CustomBookImage(
                      imageUrl: state.books[index].image ?? '',
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is RelevantBooksFailure) {
          return CustomeErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const CanLikeListViewShimmer();
        }
      },
    );
  }
}
