import 'package:booklyapp/Features/Splash/presentation/views/splash_view.dart';
import 'package:booklyapp/Features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/Features/home/domain/entities/book_entity.dart';
import 'package:booklyapp/Features/home/domain/use_cases/fetch_relevant_books_use_case.dart';
import 'package:booklyapp/Features/home/presentation/manager/relevant_books_cubit/relevant_books_cubit.dart';
import 'package:booklyapp/Features/home/presentation/views/book_details_view.dart';
import 'package:booklyapp/Features/home/presentation/views/home_view.dart';
import 'package:booklyapp/Features/search/presentation/views/search_view.dart';
import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeViewPath = '/homeView';
  static const kBookDetailsViewPath = '/bookDetailsView';
  static const kSearchViewPath = '/searchView';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeViewPath,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsViewPath,
        builder: (context, state) => BlocProvider(
          create: (context) => RelevantBooksCubit(
            FetchRelevantBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          ),
          child: BookDetailsView(
            bookEntity: state.extra as BookEntity,
          ),
        ),
      ),
      GoRoute(
        path: kSearchViewPath,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
