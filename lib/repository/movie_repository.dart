import 'dart:convert';

import 'package:fluttermovieinfo/model/movie.dart';

import 'package:http/http.dart' as http;

class MovieRepository {

  Future<MovieResult> fetchMovieInfo() async {
    final url = 'https://api.themoviedb.org/3/movie/upcoming?api_key=a64533e7ece6c72731da47c9c8bc691f&language=ko-KR&page=1';

    final response = await http.get(url);

    final jsonResult = jsonDecode(response.body);
    MovieResult movieResult = MovieResult.fromJson(jsonResult);

    return movieResult;
  }
}
