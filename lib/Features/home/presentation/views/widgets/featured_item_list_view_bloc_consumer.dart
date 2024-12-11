import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/featured_books_list_view_shimmer.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/featured_item_list_view.dart';
import 'package:booklyapp/core/utils/functions/custom_snack_bar.dart';
import 'package:booklyapp/core/widgets/custome_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedItemListViewBlocConsumer extends StatefulWidget {
  const FeaturedItemListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedItemListViewBlocConsumer> createState() =>
      _FeaturedItemListViewBlocConsumerState();
}

class _FeaturedItemListViewBlocConsumerState
    extends State<FeaturedItemListViewBlocConsumer> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is FeaturedBooksPaginationFailure) {
          customSnackBar(context, message: 'Couldn\'t load books!');
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure) {
          return FeaturedItemListView(
            books: books,
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomeErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const FeaturedBooksListViewShimmer();
        }
      },
    );
  }
}
