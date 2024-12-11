part of 'relevant_books_cubit.dart';

abstract class RelevantBooksState extends Equatable {
  const RelevantBooksState();

  @override
  List<Object> get props => [];
}

final class RelevantBooksInitial extends RelevantBooksState {}

final class RelevantBooksLoading extends RelevantBooksState {}

final class RelevantBooksFailure extends RelevantBooksState {
  final String errorMessage;

  const RelevantBooksFailure(this.errorMessage);
}

final class RelevantBooksSuccess extends RelevantBooksState {
  final List<BookEntity> books;

  const RelevantBooksSuccess(this.books);
}
