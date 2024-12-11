import 'package:booklyapp/Features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:booklyapp/Features/search/manager/search_cubit.dart';
import 'package:booklyapp/Features/search/presentation/views/widgets/search_results_list_view_shimmer.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/core/widgets/custome_error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search Results :',
                style: Styles.textStyle18,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: state.books.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: BookListViewItem(
                        bookEntity: state.books[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (state is SearchFailed) {
          return CustomeErrorMessage(errorMessage: state.errorMessage);
        } else if (state is SearchLoading) {
          return const SearchResultsListViewShimmer();
        } else {
          return Center(
            child: Text(
              'No searches yet!',
              style: Styles.textStyle20.copyWith(
                fontSize: 32,
              ),
            ),
          );
        }
      },
    );
  }
}
