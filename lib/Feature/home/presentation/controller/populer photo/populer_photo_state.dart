part of 'populer_photo_cubit.dart';

sealed class PopulerPhotoState {}

final class PopulerPhotoInitial extends PopulerPhotoState {}

final class LoadingPopulerPhotoState extends PopulerPhotoState {}

final class SuccessLoadingPopulerPhotoState extends PopulerPhotoState {
  SuccessLoadingPopulerPhotoState();
}

final class FialdedPopulerPhotoState extends PopulerPhotoState {
  final String errorMessage;
  FialdedPopulerPhotoState({required this.errorMessage});
}
