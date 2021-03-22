import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/models/movie_model.dart';
import 'package:movies_riverpod/utils.dart';

final movieServiceProvider = Provider<MovieService>((ref) {
  final config = ref.read(environmentConfigProvider);
  return MovieService(config, Dio());
});

class MovieService {
  MovieService(this._utils, this._dio);

  final Utils _utils;
  final Dio _dio;

  Future<List<MovieModel>> getMovies() async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/popular?api_key=${_utils.movieApiKey}&language=en-US&page=1",
    );

    final results = List<Map<String, dynamic>>.from(response.data['results']);

    List<MovieModel> movies =
        results.map((item) => MovieModel.fromMap(item)).toList(growable: false);

    return movies;
  }
}
