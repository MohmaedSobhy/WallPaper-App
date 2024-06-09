part of 'collections_cubit.dart';

sealed class CollectionsState {}

final class CollectionsInitial extends CollectionsState {}

final class LoadingCollectionState extends CollectionsState {}

final class SuccessLoadingCollection extends CollectionsState {
  SuccessLoadingCollection();
}

final class FailedLoadingCollection extends CollectionsState {
  final String erroMessage;
  FailedLoadingCollection({required this.erroMessage});
}
