part of 'edit_photo_cubit.dart';

sealed class EditPhotoState {}

final class EditPhotoInitial extends EditPhotoState {}

final class ChangeImageOpacity extends EditPhotoState {}

final class ChangeSliderVisiablity extends EditPhotoState {}

final class LoadingEditPhoto extends EditPhotoState {}

final class SuccessDownloadEditPhoto extends EditPhotoState {}

final class FailedDownloadEditPhoto extends EditPhotoState {}

final class SucessShareEditPhoto extends EditPhotoState {}

final class FailedShareEditPhoto extends EditPhotoState {}

final class TextWidgetVisiable extends EditPhotoState {}
