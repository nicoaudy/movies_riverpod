import 'package:flutter/material.dart';
import 'package:movies_riverpod/components/front_banner.dart';
import 'package:movies_riverpod/models/movie_model.dart';

class MovieBox extends StatelessWidget {
  final MovieModel movie;

  const MovieBox({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          movie.fullImageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: FrontBanner(text: movie.title),
        ),
      ],
    );
  }
}
