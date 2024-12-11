import 'package:booklyapp/Features/home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:booklyapp/Features/home/presentation/views/widgets/newest_books_list_view_shimmer.dart';
import 'package:booklyapp/core/widgets/custome_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksListViewBlocBuilder extends StatelessWidget {
  const NewestBooksListViewBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksListView(
            books: state.books,
          );
        } else if (state is NewestBooksFailure) {
          return CustomeErrorMessage(errorMessage: state.errorMessage);
        } else {
          return const NewestBooksListViewShimmer();
        }
      },
    );
  }
}
