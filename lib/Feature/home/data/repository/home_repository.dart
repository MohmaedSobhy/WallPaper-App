import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/collection_model.dart';
import '../model/photo_model.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<CollectionModel>>> getCollection();
  Future<Either<Failure, List<PhotoModel>>> getPopulerPhotos(
      {required int page});
}
