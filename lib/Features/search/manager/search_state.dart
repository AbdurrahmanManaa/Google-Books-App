part of 'search_cubit.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<BookEntity> books;

  SearchSuccess(this.books);
}

final class SearchFailed extends SearchState {
  final String errorMessage;

  SearchFailed(this.errorMessage);
}
