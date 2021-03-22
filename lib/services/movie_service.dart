import 'package:dio/dio.dart';
import 'package:movies_riverpod/utils.dart';

class MovieService {
  MovieService(this._utils, this._dio);

  final Utils _utils;
  final Dio _dio;
}
