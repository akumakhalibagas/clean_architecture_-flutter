import 'package:dartz/dartz.dart';
import 'package:loyalty_white_label/common/failure.dart';
import 'package:loyalty_white_label/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovie();
}
