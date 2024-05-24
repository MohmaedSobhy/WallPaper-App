part of 'collections_cubit.dart';

@immutable
sealed class CollectionsState {}

final class CollectionsInitial extends CollectionsState {}

final class LoadingCollectionState extends CollectionsState {}

final class SuccessLoadingCollection extends CollectionsState {
  final List<CollectionModel> collection;
  SuccessLoadingCollection({required this.collection});
}

final class FailedLoadingCollection extends CollectionsState {
  final String erroMessage;
  FailedLoadingCollection({required this.erroMessage});
}
