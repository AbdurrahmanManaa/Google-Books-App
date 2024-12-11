import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/use_cases/fetch_relevant_books_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'relevant_books_state.dart';

class RelevantBooksCubit extends Cubit<RelevantBooksState> {
  RelevantBooksCubit(this.relevantBooksUseCase) : super(RelevantBooksInitial());

  final FetchRelevantBooksUseCase relevantBooksUseCase;

  Future<void> fetchRelevantBooks({required String category}) async {
    emit(RelevantBooksLoading());

    var result = await relevantBooksUseCase.call(
      category,
    );
    result.fold(
      (failure) => emit(
        RelevantBooksFailure(failure.errorMessage),
      ),
      (books) => emit(
        RelevantBooksSuccess(books),
      ),
    );
  }
}
