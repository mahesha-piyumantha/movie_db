import 'dart:convert';
import 'package:flutter/cupertino.dart';
import '../models/movie.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {

  final String _apiKey = '2698f4bd';
  final String _apiUrl = 'http://www.omdbapi.com/';

  // make a list array to store the fetched movies

  List<Movie> _movies = [];
  List<Movie> _newReleases = [];
  List<Movie> _featuredSeries = [];


  List<Movie> get movies {
    return _movies;
  }
  List<Movie> get newReleases {
      return _newReleases;
  }
  List<Movie> get featuredSeries {
    return _featuredSeries;
  }



  Future<void> fetchMovieData(String title) async {
    final response = await http.get(Uri.parse('$_apiUrl?apikey=$_apiKey&s=$title'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Fetched movie data $data");

      final movieData = data['Search'] as List<dynamic>;
      _movies = movieData.map((json) => Movie.fromJson(json)).toList();

      notifyListeners();

    } else {
      throw Exception('Failed to load movie data');
    }
  }

  void clearMovies() {
    _movies.clear();
    notifyListeners();
  }
}
