import 'package:dartz/dartz.dart';
import 'package:loyalty_white_label/common/failure.dart';
import 'package:loyalty_white_label/domain/entities/movie.dart';
import 'package:loyalty_white_label/domain/repositories/movie_repository.dart';

class GetNowPlayingMovie {
  final MovieRepository repository;

  GetNowPlayingMovie(this.repository);

  Future<Either<Failure, List<Movie>>> execute() {
    return repository.getNowPlayingMovie();
  }
}
