part of 'photo_details_cubit.dart';

sealed class PhotoDetailsState {}

final class PhotoDetailsInitial extends PhotoDetailsState {}

final class PreparePhotoToDownload extends PhotoDetailsState {}

final class FailedDownloadImage extends PhotoDetailsState {}

final class SuccessDownloadImage extends PhotoDetailsState {}

final class ShareImageLoading extends PhotoDetailsState {}

final class FailedToShareImage extends PhotoDetailsState {}

final class SuccessShareImage extends PhotoDetailsState {}
