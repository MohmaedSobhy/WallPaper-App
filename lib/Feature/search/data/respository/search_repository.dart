import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../home/data/model/photo_model.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<PhotoModel>>> getSearchResultes(
      {required String searchKey});
}
