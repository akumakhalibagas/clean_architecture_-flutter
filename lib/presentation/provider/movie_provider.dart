import 'package:flutter/widgets.dart';
import 'package:loyalty_white_label/domain/usecases/movie_usecases.dart';
import '../../domain/entities/movie.dart';

enum RequestState { Empty, Loading, Loaded, Error }

class MovieNotifier extends ChangeNotifier {
  var _nowPlayingMovie = <Movie>[];
  List<Movie> get nowPlayingMovie => _nowPlayingMovie;

  RequestState _nowPlayingState = RequestState.Empty;
  RequestState get nowPlayingState => _nowPlayingState;

  String _message = '';
  String get message => _message;

  final GetNowPlayingMovie getNowPlayingMovie;
  MovieNotifier({required this.getNowPlayingMovie});

  Future<void> fetchNowPlayingMovie() async {
    _nowPlayingState = RequestState.Loading;
    notifyListeners();
    final result = await getNowPlayingMovie.execute();
    result.fold((failure) {
      _nowPlayingState = RequestState.Error;
      _message = failure.message;
      notifyListeners();
    }, (data) {
      _nowPlayingState = RequestState.Loaded;
      _nowPlayingMovie = data;
      notifyListeners();
    });
  }
}
