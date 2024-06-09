part of 'edit_photo_cubit.dart';

@immutable
sealed class EditPhotoState {}

final class EditPhotoInitial extends EditPhotoState {}

final class ChangeImageOpacity extends EditPhotoState {}

final class SliderVisiable extends EditPhotoState {}
