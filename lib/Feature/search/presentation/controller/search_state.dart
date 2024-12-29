part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class LoadingSearchResultesState extends SearchState {}

final class SuccessSearchResultesState extends SearchState {}

final class FailedSearchResultesState extends SearchState {}

final class NoSearchResulesState extends SearchState {}
