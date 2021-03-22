import 'dart:convert';

class MovieModel {
  String title;
  String posterPath;

  MovieModel({
    this.title,
    this.posterPath,
  });

  String get fullImageUrl => 'https://image.tmdb.org/t/p/w200$posterPath';

  MovieModel copyWith({
    String title,
    String posterPath,
  }) {
    return MovieModel(
      title: title ?? this.title,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'poster_path': posterPath,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['title'],
      posterPath: map['poster_path'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  String toString() => 'MovieModel(title: $title, posterPath: $posterPath)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
        other.title == title &&
        other.posterPath == posterPath;
  }

  @override
  int get hashCode => title.hashCode ^ posterPath.hashCode;
}
