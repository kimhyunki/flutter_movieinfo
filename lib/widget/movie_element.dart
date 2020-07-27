import 'package:flutter/material.dart';
import 'package:fluttermovieinfo/model/movie.dart';

class MovieElement extends StatelessWidget {
  final Results movie;

  MovieElement(this.movie);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Image.network('https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
        ),
        Text(movie.title)
      ],
    );
  }
}