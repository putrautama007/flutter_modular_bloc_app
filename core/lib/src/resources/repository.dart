import 'dart:async';
import 'sport_api_provider.dart';
import '../models/item_model.dart';
import '../models/movie_models.dart';
import 'movie_api_provider.dart';
import '../models/trailer_model.dart';

class Repository{
  final sportApiProvider = SportApiProvider();

  Future<ItemModel> fetchAllSport() => sportApiProvider.fetchSportList();

  final moviesApiProvider = MovieApiProvider();

  Future<MovieModel> fetchAllMovies() => moviesApiProvider.fetchMovieList();
  Future<TrailerModel> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}