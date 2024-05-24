import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/api_keys.dart';
import '../../../../core/api/dio_service.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/api/api_end_point.dart';
import '../model/collection_model.dart';
import '../model/photo_model.dart';
import 'home_repository.dart';

class HomeRepositoryImplementation implements HomeRepository {
  HomeRepositoryImplementation._();
  static HomeRepositoryImplementation instanse =
      HomeRepositoryImplementation._();
  @override
  Future<Either<Failure, List<CollectionModel>>> getCollection() async {
    try {
      List<CollectionModel> collections = [];
      var response = await DioService.getData(
          url: ApiEndPoint.collection, token: ApiEndPoint.token);

      for (var item in response.data[APIKeys.collections]) {
        collections.add(CollectionModel.fromJson(item));
      }
      return Right(collections);
    } catch (error) {
      log(error.toString());
      return Left(Failure(errorMessage: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PhotoModel>>> getPopulerPhotos(
      {required int page}) async {
    try {
      List<PhotoModel> photos = [];
      Response response = await DioService.getData(
          url:
              '${ApiEndPoint.populerPhoto}?${APIKeys.page}=$page&${APIKeys.perPage}=50',
          token: ApiEndPoint.token);

      for (var item in response.data[APIKeys.photos]) {
        photos.add(PhotoModel.fromJson(item));
      }
      return Right(photos);
    } catch (error) {
      log(error.toString());
      return Left(Failure(errorMessage: error.toString()));
    }
  }
}
