import 'package:booklyapp/Features/home/data/models/book_model/book_model.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/core/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.apiService) : super(SearchInitial());

  final ApiService apiService;

  searchBooks(String query) async {
    try {
      emit(SearchLoading());
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=$query');
      List<BookEntity> books = [];
      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
      emit(SearchSuccess(books));
    } catch (e) {
      emit(SearchFailed('Error fetching books!'));
    }
  }
}
