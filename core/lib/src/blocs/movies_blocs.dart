import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/movie_models.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<MovieModel>();

  Observable<MovieModel> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    if(_isDisposed) {
      return print('dijalankan');
    }
    MovieModel itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  bool _isDisposed = false;

  dispose() {
    _moviesFetcher.close();
    _isDisposed = true;
  }
}

