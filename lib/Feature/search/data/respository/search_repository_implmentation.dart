import 'package:dio/dio.dart';
import '../../../home/data/model/photo_model.dart';
import 'search_repository.dart';
import '../../../../core/api/api_end_point.dart';
import '../../../../core/api/api_keys.dart';
import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/api/dio_service.dart';

class SearchRepositoryImplmentation implements SearchRepository {
  SearchRepositoryImplmentation._();
  static SearchRepositoryImplmentation instanse =
      SearchRepositoryImplmentation._();
  @override
  Future<Either<Failure, List<PhotoModel>>> getSearchResultes(
      {required String searchKey}) async {
    try {
      List<PhotoModel> photos = [];
      Response response = await DioService.getData(
        url: '${ApiEndPoint.search}?query=$searchKey&${APIKeys.perPage}=80',
        token: ApiEndPoint.token,
      );
      for (var item in response.data[APIKeys.photos]) {
        photos.add(PhotoModel.fromJson(item));
      }
      return Right(photos);
    } catch (error) {
      return Left(Failure(errorMessage: error.toString()));
    }
  }
}
