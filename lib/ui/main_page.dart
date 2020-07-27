import 'package:flutter/material.dart';
import 'package:fluttermovieinfo/model/movie.dart';
import 'package:fluttermovieinfo/repository/movie_repository.dart';
import 'package:fluttermovieinfo/widget/movie_element.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final repository = MovieRepository();

  List<Results> items = [];
  @override
  void initState() {
    super.initState();
    // 통신

    repository.fetchMovieInfo().then((value) {
      setState(() {
        items = value.results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('영화정보검색'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: '검색'),
              onChanged: (value) {
                setState(() {
                  items = items
                      .where((e) => e.title
                        .toLowerCase()
                        .contains(value.toLowerCase())
                  ).toList();
                });
              },
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.8,
                children: items.map((e) => MovieElement(e)).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
