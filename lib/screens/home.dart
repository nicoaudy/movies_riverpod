import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_riverpod/components/error_body.dart';
import 'package:movies_riverpod/components/movie_box.dart';
import 'package:movies_riverpod/models/movie_model.dart';
import 'package:movies_riverpod/services/movie_service.dart';

final movieFutureProvider =
    FutureProvider.autoDispose<List<MovieModel>>((ref) async {
  ref.maintainState = true;

  final movieService = ref.read(movieServiceProvider);
  final movies = await movieService.getMovies();
  return movies;
});

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Movies"),
      ),
      body: watch(movieFutureProvider).when(
        loading: () => Center(child: CircularProgressIndicator()),
        error: (e, s) {
          return ErrorBody(
            message: "Error",
            onPressed: () => context.refresh(movieFutureProvider),
          );
        },
        data: (movies) {
          return RefreshIndicator(
            onRefresh: () {
              return context.refresh(movieFutureProvider);
            },
            child: GridView.extent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.7,
              children: movies.map((movie) => MovieBox(movie: movie)).toList(),
            ),
          );
        },
      ),
    );
  }
}
